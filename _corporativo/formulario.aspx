<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo/corporativoPage.master" AutoEventWireup="false" CodeFile="formulario.aspx.vb" Inherits="_corporativo_formulario" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
    <script type="text/javascript">
    $(function () {
        $("#accordion").accordion();
    });
	</script>   
<br />
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_corporativo/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" CssClass="msnOK"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <table id="CABEC" align="center" width="930px">
        <tr>
            <td align="left">
                <br />
                <asp:Label ID="LabelCABEC" runat="server" CssClass="h1" Text="Atualização Rápida"></asp:Label>
    
        <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="key_to_UPDATELabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="table_to_UPDATELabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="column_to_UPDATELabel" runat="server" Visible="False"></asp:Label>
                <table id="NAVEGADOR" align="center" bgcolor="#F3F3F3" cellpadding="0" 
                    cellspacing="0" width="930px">
                    <tr>
                        <td></td>
                    </tr> 
                </table> 
            </td>
        </tr> 
    </table> 
<!-- MENU -->
    <table cellpadding="0" cellspacing="0" align="center" width="930px" id="Master">
        <tr>
            <td>
                <table id="BodyInterno" runat="server" border="0" cellpadding="0" cellspacing="0" visible="true" align="center" width="930px">
                    <tr>
                        <td valign="top" width="30">
                            <asp:Image ID="lateral1" runat="server" ImageUrl="~/images/h26.gif" />
                        </td>
                        <td valign="top" width="900" align="left">
                            <asp:FormView ID="FormViewCadastro" runat="server" 
                                DataKeyNames="idCadastroUser" DataSourceID="SqlCadastro">
                                <EditItemTemplate>
                                    areaAtuacao:
                                    <asp:TextBox ID="areaAtuacaoTextBox" runat="server" 
                                        Text='<%# Bind("areaAtuacao") %>' />
                                    <br />
                                    interesse01:
                                    <asp:TextBox ID="interesse01TextBox" runat="server" 
                                        Text='<%# Bind("interesse01") %>' />
                                    <br />
                                    interesse02:
                                    <asp:TextBox ID="interesse02TextBox" runat="server" 
                                        Text='<%# Bind("interesse02") %>' />
                                    <br />
                                    interesse03:
                                    <asp:TextBox ID="interesse03TextBox" runat="server" 
                                        Text='<%# Bind("interesse03") %>' />
                                    <br />
                                    idCadastroUser:
                                    <asp:Label ID="idCadastroUserLabel1" runat="server" 
                                        Text='<%# Eval("idCadastroUser") %>' />
                                    <br />
                                    idUser:
                                    <asp:TextBox ID="idUserTextBox" runat="server" Text='<%# Bind("idUser") %>' />
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                        CommandName="Update" Text="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    areaAtuacao:
                                    <asp:TextBox ID="areaAtuacaoTextBox0" runat="server" 
                                        Text='<%# Bind("areaAtuacao") %>' />
                                    <br />
                                    interesse01:
                                    <asp:TextBox ID="interesse01TextBox0" runat="server" 
                                        Text='<%# Bind("interesse01") %>' />
                                    <br />
                                    interesse02:
                                    <asp:TextBox ID="interesse02TextBox0" runat="server" 
                                        Text='<%# Bind("interesse02") %>' />
                                    <br />
                                    interesse03:
                                    <asp:TextBox ID="interesse03TextBox0" runat="server" 
                                        Text='<%# Bind("interesse03") %>' />
                                    <br />

                                    idUser:
                                    <asp:TextBox ID="idUserTextBox0" runat="server" Text='<%# Bind("idUser") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                        CommandName="Insert" Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <br />
<div class="demo">

<div id="accordion">
	<h3><a href="#">Section 1</a></h3>
	<div>
		<p>
		    <asp:LinkButton ID="LinkButton_areaAtuacao" runat="server" 
                CommandArgument="areaAtuacao" CommandName="Select" 
                CssClass="textoProcessoSeletivo" onclick="LinkButton_areaAtuacao_Click" 
                Text='<%# Eval("areaAtuacao") %>'></asp:LinkButton>
		</p>
	</div>
	<h3><a href="#">Section 2</a></h3>
	<div>
		<p>
		    <asp:LinkButton ID="LinkButton_interesse01" runat="server" 
                CommandArgument="interesse01" CommandName="Select" 
                CssClass="textoProcessoSeletivo" onclick="LinkButton_interesse01_Click" 
                Text='<%# Eval("interesse01") %>'></asp:LinkButton>
		</p>
	</div>
	<h3><a href="#">Section 3</a></h3>
	<div>
		<p>
		    <asp:LinkButton ID="LinkButton_interesse02" runat="server" 
                CommandArgument="interesse02" CommandName="Select" 
                CssClass="textoProcessoSeletivo" onclick="LinkButton_interesse02_Click" 
                Text='<%# Eval("interesse02") %>'></asp:LinkButton>
		</p>
	</div>
	<h3><a href="#">Section 4</a></h3>
	<div>
		<p>
		    <asp:LinkButton ID="LinkButton_interesse03" runat="server" 
                CommandArgument="interesse03" CommandName="Select" 
                CssClass="textoProcessoSeletivo" onclick="LinkButton_interesse03_Click" 
                Text='<%# Eval("interesse03") %>'></asp:LinkButton>
		</p>
	</div>
</div>

</div>
                                    <br />
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>                         
            </td>
        </tr>
    </table>
    <div id="wrapper">
        <asp:Panel ID="PanelEDICAO" runat="server" Visible="False" Width="500px">
            <table ID="EDITOR" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Width="400px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                        <asp:LinkButton ID="LinkButtonSalvarNome" runat="server" CssClass="button">Salvar</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <asp:SqlDataSource ID="SqlCadastro" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT [areaAtuacao], [interesse01], [interesse02], [interesse03], [idCadastroUser], [idUser] FROM [tbCadastroUser] WHERE ([idUser] = @idUser)" 
        DeleteCommand="DELETE FROM [tbCadastroUser] WHERE [idCadastroUser] = @idCadastroUser" 
        InsertCommand="INSERT INTO [tbCadastroUser] ([areaAtuacao], [interesse01], [interesse02], [interesse03], [idUser]) VALUES (@areaAtuacao, @interesse01, @interesse02, @interesse03, @idUser)" 
        UpdateCommand="UPDATE [tbCadastroUser] SET [areaAtuacao] = @areaAtuacao, [interesse01] = @interesse01, [interesse02] = @interesse02, [interesse03] = @interesse03, [idUser] = @idUser WHERE [idCadastroUser] = @idCadastroUser">
        <DeleteParameters>
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="areaAtuacao" Type="String" />
            <asp:Parameter Name="interesse01" Type="String" />
            <asp:Parameter Name="interesse02" Type="String" />
            <asp:Parameter Name="interesse03" Type="String" />
            <asp:Parameter Name="idUser" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idUserLabel" Name="idUser" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="areaAtuacao" Type="String" />
            <asp:Parameter Name="interesse01" Type="String" />
            <asp:Parameter Name="interesse02" Type="String" />
            <asp:Parameter Name="interesse03" Type="String" />
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

