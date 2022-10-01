<%@ Control Language="VB" AutoEventWireup="false" CodeFile="lateralZoya.ascx.vb" Inherits="App_Include_lateralZoya" %>

        <% If Session("idZoya") Then%>
                
                <script type="text/javascript">
                    <!--
                        var vagasbn = new Flash("/swf/lateralDzoya.swf", "Zoya", "120", "180"); 
                        vagasbn.write();
                    //-->
                </script> 
                 
        <% End If%>   