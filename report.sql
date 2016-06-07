set serveroutput on
set verify off
set feedback off

spool &result_migration_file_path

declare
starName varchar2(50):='&starName';
lim number:=&recordsLimit;
--///
kursor sys_refcursor;

starName_name varchar2(100);
type complex3 is record(field1 varchar2(100), field2 varchar2(200));
line3 complex3;
                     
query2 varchar2(500):='select bp.BPHOTOMETRYID, bp.BPHOTOMETRY from DB2.bPhotometry bp join DB2.observations ob on bp.BPHOTOMETRYID=ob.BPHOTOMETRYID where ob.STARNAME = '''||starName||''' and rownum < '||lim||' order by BPHOTOMETRYID asc';  
query3 varchar2(500):='select bp.VPHOTOMETRYID, bp.VPHOTOMETRY from DB2.vPhotometry bp join DB2.observations ob on bp.VPHOTOMETRYID=ob.VPHOTOMETRYID where ob.STARNAME = '''||starName||''' and rownum < '||lim||' order by VPHOTOMETRYID asc';  
query4 varchar2(500):='select bp.UPHOTOMETRYID, bp.UPHOTOMETRY from DB2.uPhotometry bp join DB2.observations ob on bp.UPHOTOMETRYID=ob.UPHOTOMETRYID where ob.STARNAME = '''||starName||''' and rownum < '||lim||' order by UPHOTOMETRYID asc';  



query_starName_Id varchar2(100):='select distinct(Id) from StagingObservations where starName='||starName||' ';

bPhotometry varchar2(50);
count_bPhotometry number;
vPhotometry varchar2(50);
count_vPhotometry number;
uPhotometry varchar2(50);
count_uPhotometry number;

begin

--------------------------------------------------------
--  SECTION 1 - HTML styling
--------------------------------------------------------  

dbms_output.put_line('
<style type="text/css"> 
body {
   margin: -25px 50px 50px 50px;
}

div.scrollWrapper{
  height:100%px;
  width:1120px;
  overflow-x: scroll; 
  overflow-y: hidden;
}

table {
background-color:#F2F2F5;
border-width:1px 1px 0px 1px;
border-color:#C9CBD3;
border-style:solid;
width:100%px;
}
td {
font-family:Tahoma,Arial,Helvetica,Geneva,sans-serif;
font-size:9pt;
background-color:#EAEFF5;
padding:18px;
background-color:#F2F2F5;
border-color:#ffffff #ffffff #cccccc #ffffff;
border-style:solid solid solid solid;
border-width:0px 0px 1px 0px;
text-align: center;
}
th {
font-family:Tahoma,Arial,Helvetica,Geneva,sans-serif;
font-size:9pt;
padding:15px;
padding-left:10px;
background-color:#CFE0F1;
border-color:#ffffff #ffffff #cccccc #ffffff;
border-style:solid solid solid none;
border-width:1px 0px 1px 0px;
white-space:nowrap;
padding-right:10px;
}
.table2 {
border-width:0px 0px 0px 0px;
border-style:solid;
padding: 0px;
width:100%;
}
.td2 {
padding:8px;
background-color:white;
vertical-align: top;
padding-left: 20px;
text-align: left;
}
.th2 {
font-family:Tahoma,Arial,Helvetica,Geneva,sans-serif;
font-size:9pt;
padding:15px;
padding-left:45px;
background-color:#CFE0F1;
border-color:#ffffff #ffffff #cccccc #ffffff;
border-style:solid solid solid none;
border-width:1px 0px 1px 0px;
white-space:nowrap;
padding-right:55px;
}
.th3 {
font-family:Tahoma,Arial,Helvetica,Geneva,sans-serif;
font-size:9pt;
padding:15px;
padding-left:85px;
background-color:#CFE0F1;
border-color:#ffffff #ffffff #cccccc #ffffff;
border-style:solid solid solid none;
border-width:1px 0px 1px 0px;
white-space:nowrap;
padding-right:85px;
}
</style>');
 
 
--------------------------------------------------------
--  SECTION 2 - Tables data
--------------------------------------------------------   

dbms_output.put_line('<hr><center><font face="Tahoma" size="4"><br>Tables data</font></center><br>');
dbms_output.put_line('<div class="scrollWrapper" onload="javascript:resizeIframe(this);"><table class="table2" border="0" cellpadding="0" cellspacing="0"><tr><td class="td2">');--here hidden table starts

dbms_output.put_line('<table class="table2" border="0" cellpadding="0" cellspacing="0"><tr><td class="td2">');--hidden table
open kursor for query2;
dbms_output.put_line('<br><font face="Tahoma" size="3">' || 'BPHOTOMETRY' || '</font>');
dbms_output.put_line('<table border="0" cellpadding="0" cellspacing="0"><tr><th>BPHOTOMETRYID</th><th>BPHOTOMETRY</th></tr>');
loop fetch kursor into line3;
   exit when kursor%notfound; 
   dbms_output.put_line('<tr><td>' || line3.field1 || '</td><td>' || line3.field2 || '</td></tr>'); 
end loop;
dbms_output.put_line('</TABLE></td>');
close kursor;

open kursor for query3;
dbms_output.put_line('<td class="td2"><br><font face="Tahoma" size="3">' || 'VPHOTOMETRY' || '</font>');
dbms_output.put_line('<table border="0" cellpadding="0" cellspacing="0"><tr><th>VPHOTOMETRYID</th><th>VPHOTOMETRY</th></tr>');
loop fetch kursor into line3;
   exit when kursor%notfound; 
   dbms_output.put_line('<tr><td>' || line3.field1 || '</td><td>' || line3.field2 || '</td></tr>');
end loop;
dbms_output.put_line('</TABLE></td>');
close kursor;

open kursor for query4;
dbms_output.put_line('<td class="td2"><br><font face="Tahoma" size="3">' || 'UPHOTOMETRY' || '</font>');
dbms_output.put_line('<table border="0" cellpadding="0" cellspacing="0"><tr><th>UPHOTOMETRYID</th><th>UPHOTOMETRY</th></tr>');
loop fetch kursor into line3;
   exit when kursor%notfound; 
   dbms_output.put_line('<tr><td>' || line3.field1 || '</td><td>' || line3.field2 || '</td></tr>');
end loop;
dbms_output.put_line('</TABLE>');
close kursor;

dbms_output.put_line('</td></tr></TABLE></div><br>');
 
 

--------------------------------------------------------
--  SECTION 3 - Tables counts
--------------------------------------------------------    

dbms_output.put_line('<hr><center><font face="Tahoma" size="4">Tables counts</font></center>');
execute immediate 'select count(bp.BPHOTOMETRYID) from DB2.bPhotometry bp join DB2.observations ob on bp.BPHOTOMETRYID=ob.BPHOTOMETRYID 
                       where ob.STARNAME = '''||starName||'''' into count_bPhotometry;
execute immediate 'select count(bp.VPHOTOMETRYID) from DB2.vPhotometry bp join DB2.observations ob on bp.VPHOTOMETRYID=ob.VPHOTOMETRYID 
                       where ob.STARNAME = '''||starName||'''' into count_vPhotometry;     
execute immediate 'select count(bp.UPHOTOMETRYID) from DB2.uPhotometry bp join DB2.observations ob on bp.UPHOTOMETRYID=ob.UPHOTOMETRYID 
                       where ob.STARNAME = '''||starName||'''' into count_uPhotometry;                          
                       
                       
dbms_output.put_line('<table border="0" cellpadding="0" cellspacing="0" style="text-align: left;">
                        <tr><th>Number of records in BPHOTOMETRY table for "'||starName||'" </th><td>'||count_bPhotometry||'</td>
                        <th>Number of records in VPHOTOMETRY table for "'||starName||'" </th><td>'||count_vPhotometry||'</td>
                        <th>Number of records in UPHOTOMETRY table for "'||starName||'" </th><td>'||count_uPhotometry||'</td></tr>');
                                                                        
dbms_output.put_line('<br></body>');

end;
/
spool off
set serveroutput off