<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="relatorioParametrizacao.aspx.vb" Inherits="_admin_relatorioParametrizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Relatórios)"></asp:Label>
    <br />
                <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idRelatorioLabel" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="EmpresaLabel" runat="server" CssClass="titulo"></asp:Label>
    <br />
    <asp:GridView ID="GridViewEmpresa" runat="server" AutoGenerateColumns="False" 
        BorderStyle="None" DataKeyNames="idsetup,idCadastroEmpresa,empresa" 
        DataSourceID="SqlEMPRESA" GridLines="Horizontal" Width="100%" 
        AllowPaging="True">
        <AlternatingRowStyle BackColor="WhiteSmoke" />
        <Columns>
            <asp:BoundField DataField="idsetup" HeaderText="idsetup" InsertVisible="False" 
                ReadOnly="True" SortExpression="idsetup" Visible="False" />
            <asp:ButtonField CommandName="Select" DataTextField="empresa" 
                HeaderText="Empresa" Text="Button" />
            <asp:BoundField DataField="empresa" HeaderText="Empresa" 
                SortExpression="empresa" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                SortExpression="idCadastroEmpresa" Visible="False" />
        </Columns>
    </asp:GridView>
                <asp:FormView ID="FormViewRELATORIO" runat="server" 
        DataKeyNames="idRelatorio" DataSourceID="SqlRELATORIOFORM" Width="100%">
                    <EditItemTemplate>
                        idRelatorio:
                        <asp:Label ID="idRelatorioLabel1" runat="server" 
                            Text='<%# Eval("idRelatorio") %>' />
                        <br />
                        idSetup:
                        <asp:TextBox ID="idSetupTextBox" runat="server" Text='<%# Bind("idSetup") %>' />
                        <br />
                        descritivo:
                        <asp:TextBox ID="descritivoTextBox" runat="server" 
                            Text='<%# Bind("descritivo") %>' />
                        <br />
                        relatorio:
                        <asp:TextBox ID="relatorioTextBox" runat="server" 
                            Text='<%# Bind("relatorio") %>' />
                        <br />
                        procedureTipo:
                        <asp:TextBox ID="procedureTipoTextBox" runat="server" 
                            Text='<%# Bind("procedureTipo") %>' />
                        <br />
                        parametro1:
                        <asp:TextBox ID="parametro1TextBox" runat="server" 
                            Text='<%# Bind("parametro1") %>' />
                        <br />
                        parametro2:
                        <asp:TextBox ID="parametro2TextBox" runat="server" 
                            Text='<%# Bind("parametro2") %>' />
                        <br />
                        parametro3:
                        <asp:TextBox ID="parametro3TextBox" runat="server" 
                            Text='<%# Bind("parametro3") %>' />
                        <br />
                        parametro4:
                        <asp:TextBox ID="parametro4TextBox" runat="server" 
                            Text='<%# Bind("parametro4") %>' />
                        <br />
                        filtro:
                        <asp:TextBox ID="filtroTextBox" runat="server" Text='<%# Bind("filtro") %>' />
                        <br />
                        chartPrimeiraLinha:
                        <asp:TextBox ID="chartPrimeiraLinhaTextBox" runat="server" 
                            Text='<%# Bind("chartPrimeiraLinha") %>' />
                        <br />
                        chartModelo:
                        <asp:TextBox ID="chartModeloTextBox" runat="server" 
                            Text='<%# Bind("chartModelo") %>' />
                        <br />
                        chartCampo1:
                        <asp:TextBox ID="chartCampo1TextBox" runat="server" 
                            Text='<%# Bind("chartCampo1") %>' />
                        <br />
                        chartCampo2:
                        <asp:TextBox ID="chartCampo2TextBox" runat="server" 
                            Text='<%# Bind("chartCampo2") %>' />
                        <br />
                        chartCampo3:
                        <asp:TextBox ID="chartCampo3TextBox" runat="server" 
                            Text='<%# Bind("chartCampo3") %>' />
                        <br />
                        chartCampo4:
                        <asp:TextBox ID="chartCampo4TextBox" runat="server" 
                            Text='<%# Bind("chartCampo4") %>' />
                        <br />
                        chartCampo5:
                        <asp:TextBox ID="chartCampo5TextBox" runat="server" 
                            Text='<%# Bind("chartCampo5") %>' />
                        <br />
                        chartnumeroCampo:
                        <asp:TextBox ID="chartnumeroCampoTextBox" runat="server" 
                            Text='<%# Bind("chartnumeroCampo") %>' />
                        <br />
                        chartPrimeiroParametro:
                        <asp:TextBox ID="chartPrimeiroParametroTextBox" runat="server" 
                            Text='<%# Bind("chartPrimeiroParametro") %>' />
                        <br />
                        apresentar:
                        <asp:TextBox ID="apresentarTextBox" runat="server" 
                            Text='<%# Bind("apresentar") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButtonCARGA" runat="server" CssClass="button" 
                            onclick="LinkButtonCARGA_Click">Carga</asp:LinkButton>
                        <br />
                        <br />
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        idSetup:
                        <asp:TextBox ID="idSetupTextBox" runat="server" Text='<%# Bind("idSetup") %>' />
                        <br />
                        descritivo:
                        <asp:TextBox ID="descritivoTextBox" runat="server" 
                            Text='<%# Bind("descritivo") %>' />
                        <br />
                        relatorio:
                        <asp:TextBox ID="relatorioTextBox" runat="server" 
                            Text='<%# Bind("relatorio") %>' />
                        <br />
                        procedureTipo:
                        <asp:TextBox ID="procedureTipoTextBox" runat="server" 
                            Text='<%# Bind("procedureTipo") %>' />
                        <br />
                        parametro1:
                        <asp:TextBox ID="parametro1TextBox" runat="server" 
                            Text='<%# Bind("parametro1") %>' />
                        <br />
                        parametro2:
                        <asp:TextBox ID="parametro2TextBox" runat="server" 
                            Text='<%# Bind("parametro2") %>' />
                        <br />
                        parametro3:
                        <asp:TextBox ID="parametro3TextBox" runat="server" 
                            Text='<%# Bind("parametro3") %>' />
                        <br />
                        parametro4:
                        <asp:TextBox ID="parametro4TextBox" runat="server" 
                            Text='<%# Bind("parametro4") %>' />
                        <br />
                        filtro:
                        <asp:TextBox ID="filtroTextBox" runat="server" Text='<%# Bind("filtro") %>' />
                        <br />
                        chartPrimeiraLinha:
                        <asp:TextBox ID="chartPrimeiraLinhaTextBox" runat="server" 
                            Text='<%# Bind("chartPrimeiraLinha") %>' />
                        <br />
                        chartModelo:
                        <asp:TextBox ID="chartModeloTextBox" runat="server" 
                            Text='<%# Bind("chartModelo") %>' />
                        <br />
                        chartCampo1:
                        <asp:TextBox ID="chartCampo1TextBox" runat="server" 
                            Text='<%# Bind("chartCampo1") %>' />
                        <br />
                        chartCampo2:
                        <asp:TextBox ID="chartCampo2TextBox" runat="server" 
                            Text='<%# Bind("chartCampo2") %>' />
                        <br />
                        chartCampo3:
                        <asp:TextBox ID="chartCampo3TextBox" runat="server" 
                            Text='<%# Bind("chartCampo3") %>' />
                        <br />
                        chartCampo4:
                        <asp:TextBox ID="chartCampo4TextBox" runat="server" 
                            Text='<%# Bind("chartCampo4") %>' />
                        <br />
                        chartCampo5:
                        <asp:TextBox ID="chartCampo5TextBox" runat="server" 
                            Text='<%# Bind("chartCampo5") %>' />
                        <br />
                        chartnumeroCampo:
                        <asp:TextBox ID="chartnumeroCampoTextBox" runat="server" 
                            Text='<%# Bind("chartnumeroCampo") %>' />
                        <br />
                        chartPrimeiroParametro:
                        <asp:TextBox ID="chartPrimeiroParametroTextBox" runat="server" 
                            Text='<%# Bind("chartPrimeiroParametro") %>' />
                        <br />
                        apresentar:
                        <asp:TextBox ID="apresentarTextBox" runat="server" 
                            Text='<%# Bind("apresentar") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="relatorioLabel" runat="server" CssClass="titulo" 
                            Text='<%# Bind("relatorio") %>' />
                        <br />
                        <asp:Label ID="descritivoLabel" runat="server" 
                            Text='<%# Bind("descritivo") %>' />
                        <br />
                        <br />
                        procedureTipo:
                        <asp:Label ID="procedureTipoLabel" runat="server" 
                            Text='<%# Bind("procedureTipo") %>' />
                        <br />
                        parametro1:
                        <asp:Label ID="parametro1Label" runat="server" 
                            Text='<%# Bind("parametro1") %>' />
                        <br />
                        parametro2:
                        <asp:Label ID="parametro2Label" runat="server" 
                            Text='<%# Bind("parametro2") %>' />
                        <br />
                        parametro3:
                        <asp:Label ID="parametro3Label" runat="server" 
                            Text='<%# Bind("parametro3") %>' />
                        <br />
                        parametro4:
                        <asp:Label ID="parametro4Label" runat="server" 
                            Text='<%# Bind("parametro4") %>' />
                        <br />
                        filtro:
                        <asp:Label ID="filtroLabel" runat="server" Text='<%# Bind("filtro") %>' />
                        <br />
                        chartPrimeiraLinha:
                        <asp:Label ID="chartPrimeiraLinhaLabel" runat="server" 
                            Text='<%# Bind("chartPrimeiraLinha") %>' />
                        <br />
                        chartModelo:
                        <asp:Label ID="chartModeloLabel" runat="server" 
                            Text='<%# Bind("chartModelo") %>' />
                        <br />
                        chartCampo1:
                        <asp:Label ID="chartCampo1Label" runat="server" 
                            Text='<%# Bind("chartCampo1") %>' />
                        <br />
                        chartCampo2:
                        <asp:Label ID="chartCampo2Label" runat="server" 
                            Text='<%# Bind("chartCampo2") %>' />
                        <br />
                        chartCampo3:
                        <asp:Label ID="chartCampo3Label" runat="server" 
                            Text='<%# Bind("chartCampo3") %>' />
                        <br />
                        chartCampo4:
                        <asp:Label ID="chartCampo4Label" runat="server" 
                            Text='<%# Bind("chartCampo4") %>' />
                        <br />
                        chartCampo5:
                        <asp:Label ID="chartCampo5Label" runat="server" 
                            Text='<%# Bind("chartCampo5") %>' />
                        <br />
                        chartnumeroCampo:
                        <asp:Label ID="chartnumeroCampoLabel" runat="server" 
                            Text='<%# Bind("chartnumeroCampo") %>' />
                        <br />
                        chartPrimeiroParametro:
                        <asp:Label ID="chartPrimeiroParametroLabel" runat="server" 
                            Text='<%# Bind("chartPrimeiroParametro") %>' />
                        <br />
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" CssClass="button" Text="Editar" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" CssClass="button" 
                            onclientclick="return confirm(&quot;Quer excluir este relatório?&quot;)" 
                            Text="Excluir" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" CssClass="button" Text="Novo relatório" />
                    </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:GridView ID="GridViewRELATORIO" runat="server" AutoGenerateColumns="False" 
        BorderStyle="None" DataKeyNames="idRelatorio" DataSourceID="SqlRELATORIOLISTA" 
        GridLines="Horizontal" Width="100%">
        <AlternatingRowStyle BackColor="WhiteSmoke" />
        <Columns>
            <asp:BoundField DataField="idRelatorio" HeaderText="idRelatorio" 
                InsertVisible="False" ReadOnly="True" SortExpression="idRelatorio" 
                Visible="False" />
            <asp:TemplateField HeaderText="Relatório" SortExpression="relatorio">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("relatorio") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" 
                        Text='<%# Eval("relatorio") %>' ToolTip='<%# Eval("descritivo") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlRELATORIOLISTA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT tbRelatorioParametrizacao.idRelatorio, tbRelatorioParametrizacao.idSetup, tbRelatorioParametrizacao.descritivo, tbRelatorioParametrizacao.relatorio, 
                      tbRelatorioParametrizacao.procedureTipo, tbRelatorioParametrizacao.parametro1, tbRelatorioParametrizacao.parametro2, tbRelatorioParametrizacao.parametro3, 
                      tbRelatorioParametrizacao.parametro4, tbRelatorioParametrizacao.filtro, tbRelatorioParametrizacao.chartPrimeiraLinha, tbRelatorioParametrizacao.chartModelo, 
                      tbRelatorioParametrizacao.chartCampo1, tbRelatorioParametrizacao.chartCampo2, tbRelatorioParametrizacao.chartCampo3, tbRelatorioParametrizacao.chartCampo4, 
                      tbRelatorioParametrizacao.chartCampo5, tbRelatorioParametrizacao.chartnumeroCampo, tbRelatorioParametrizacao.chartPrimeiroParametro, 
                      tbRelatorioParametrizacao.apresentar, tbCadastroEmpresa.idCadastroEmpresa
FROM         tbRelatorioParametrizacao INNER JOIN
                      tbsetup ON tbRelatorioParametrizacao.idSetup = tbsetup.idsetup INNER JOIN
                      tbCadastroEmpresa ON tbsetup.idCadastroEmpresa = tbCadastroEmpresa.idCadastroEmpresa 
WHERE
(tbCadastroEmpresa.idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                Name="idCadastroEmpresa" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlRELATORIOFORM" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbRelatorioParametrizacao] WHERE [idRelatorio] = @idRelatorio" 
        InsertCommand="INSERT INTO [tbRelatorioParametrizacao] ([idSetup], [descritivo], [relatorio], [procedureTipo], [parametro1], [parametro2], [parametro3], [parametro4], [filtro], [chartPrimeiraLinha], [chartModelo], [chartCampo1], [chartCampo2], [chartCampo3], [chartCampo4], [chartCampo5], [chartnumeroCampo], [chartPrimeiroParametro], [apresentar]) VALUES (@idSetup, @descritivo, @relatorio, @procedureTipo, @parametro1, @parametro2, @parametro3, @parametro4, @filtro, @chartPrimeiraLinha, @chartModelo, @chartCampo1, @chartCampo2, @chartCampo3, @chartCampo4, @chartCampo5, @chartnumeroCampo, @chartPrimeiroParametro, @apresentar)" 
        SelectCommand="SELECT [idRelatorio], [idSetup], [descritivo], [relatorio], [procedureTipo], [parametro1], [parametro2], [parametro3], [parametro4], [filtro], [chartPrimeiraLinha], [chartModelo], [chartCampo1], [chartCampo2], [chartCampo3], [chartCampo4], [chartCampo5], [chartnumeroCampo], [chartPrimeiroParametro], [apresentar] FROM [tbRelatorioParametrizacao] WHERE ([idRelatorio] = @idRelatorio)" 
        UpdateCommand="UPDATE [tbRelatorioParametrizacao] SET [idSetup] = @idSetup, [descritivo] = @descritivo, [relatorio] = @relatorio, [procedureTipo] = @procedureTipo, [parametro1] = @parametro1, [parametro2] = @parametro2, [parametro3] = @parametro3, [parametro4] = @parametro4, [filtro] = @filtro, [chartPrimeiraLinha] = @chartPrimeiraLinha, [chartModelo] = @chartModelo, [chartCampo1] = @chartCampo1, [chartCampo2] = @chartCampo2, [chartCampo3] = @chartCampo3, [chartCampo4] = @chartCampo4, [chartCampo5] = @chartCampo5, [chartnumeroCampo] = @chartnumeroCampo, [chartPrimeiroParametro] = @chartPrimeiroParametro, [apresentar] = @apresentar WHERE [idRelatorio] = @idRelatorio">
        <DeleteParameters>
            <asp:Parameter Name="idRelatorio" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="idSetup" Type="Int32" />
            <asp:Parameter Name="descritivo" Type="String" />
            <asp:Parameter Name="relatorio" Type="String" />
            <asp:Parameter Name="procedureTipo" Type="String" />
            <asp:Parameter Name="parametro1" Type="String" />
            <asp:Parameter Name="parametro2" Type="String" />
            <asp:Parameter Name="parametro3" Type="String" />
            <asp:Parameter Name="parametro4" Type="String" />
            <asp:Parameter Name="filtro" Type="String" />
            <asp:Parameter Name="chartPrimeiraLinha" Type="String" />
            <asp:Parameter Name="chartModelo" Type="String" />
            <asp:Parameter Name="chartCampo1" Type="String" />
            <asp:Parameter Name="chartCampo2" Type="String" />
            <asp:Parameter Name="chartCampo3" Type="String" />
            <asp:Parameter Name="chartCampo4" Type="String" />
            <asp:Parameter Name="chartCampo5" Type="String" />
            <asp:Parameter Name="chartnumeroCampo" Type="Int32" />
            <asp:Parameter Name="chartPrimeiroParametro" Type="Int32" />
            <asp:Parameter Name="apresentar" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idRelatorioLabel" Name="idRelatorio" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="idSetup" Type="Int32" />
            <asp:Parameter Name="descritivo" Type="String" />
            <asp:Parameter Name="relatorio" Type="String" />
            <asp:Parameter Name="procedureTipo" Type="String" />
            <asp:Parameter Name="parametro1" Type="String" />
            <asp:Parameter Name="parametro2" Type="String" />
            <asp:Parameter Name="parametro3" Type="String" />
            <asp:Parameter Name="parametro4" Type="String" />
            <asp:Parameter Name="filtro" Type="String" />
            <asp:Parameter Name="chartPrimeiraLinha" Type="String" />
            <asp:Parameter Name="chartModelo" Type="String" />
            <asp:Parameter Name="chartCampo1" Type="String" />
            <asp:Parameter Name="chartCampo2" Type="String" />
            <asp:Parameter Name="chartCampo3" Type="String" />
            <asp:Parameter Name="chartCampo4" Type="String" />
            <asp:Parameter Name="chartCampo5" Type="String" />
            <asp:Parameter Name="chartnumeroCampo" Type="Int32" />
            <asp:Parameter Name="chartPrimeiroParametro" Type="Int32" />
            <asp:Parameter Name="apresentar" Type="Int32" />
            <asp:Parameter Name="idRelatorio" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

