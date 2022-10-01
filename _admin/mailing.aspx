<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="mailing.aspx.vb" Inherits="_admin_mailing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="mailing" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Mailing)"></asp:Label>
                <asp:Label ID="idCampanhaLabel" runat="server" Text="0" Visible="False"></asp:Label>
                <br />
                <br />
                <br />
                <asp:FormView ID="FormViewMailing" runat="server" DataKeyNames="idCampanha" DataSourceID="SqlDataSourceFormMailing">
                    <EditItemTemplate>
                        Campanha:
                        <br />
                        <asp:TextBox ID="Nome_CampanhaTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Nome_Campanha") %>' />
                        <br />
                        Email Conta:
                        <br />
                        <asp:TextBox ID="Email_ContaTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Email_Conta") %>' />
                        <br />
                        Email Assunto:
                        <br />
                        <asp:TextBox ID="Email_AssuntoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Email_Assunto") %>' />
                        <br />
                        Email Corpo:
                        <br />
                        <asp:Label ID="LabelCorpo" runat="server" Text='<%# Eval("Email_Corpo") %>'></asp:Label>
                        <br />
                        <asp:TextBox ID="Email_CorpoTextBox" runat="server" CssClass="InputCad" Height="100px" Text='<%# Bind("Email_Corpo") %>' TextMode="MultiLine" />
                        <br />
                        Envio Quantidade:
                        <br />
                        <asp:TextBox ID="Envio_QuantidadeTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Envio_Quantidade") %>' />
                        <br />
                        Hora Publicacao inicio:
                        <br />
                        <asp:TextBox ID="Hora_Publicacao_InicioTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Hora_Publicacao_Inicio") %>' />
                        <br />
                        Hora Publicacao Fim:
                        <br />
                        <asp:TextBox ID="Hora_Publicacao_FimTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Hora_Publicacao_Fim") %>' />
                        <br />
                        Envio Delay em Minutos:
                        <br />
                        <asp:TextBox ID="Envio_Delay_MinutosTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Envio_Delay_Minutos") %>' />
                        <br />
                        <br />
                        Postar_Segunda:
                        <asp:CheckBox ID="Postar_SegundaCheckBox" runat="server" Checked='<%# Bind("Postar_Segunda") %>' />
                        <br />
                        Postar_Terca:
                        <asp:CheckBox ID="Postar_TercaCheckBox" runat="server" Checked='<%# Bind("Postar_Terca") %>' />
                        <br />
                        Postar_Quarta:
                        <asp:CheckBox ID="Postar_QuartaCheckBox" runat="server" Checked='<%# Bind("Postar_Quarta") %>' />
                        <br />
                        Postar_Quinta:
                        <asp:CheckBox ID="Postar_QuintaCheckBox" runat="server" Checked='<%# Bind("Postar_Quinta") %>' />
                        <br />
                        Postar_Sexta:
                        <asp:CheckBox ID="Postar_SextaCheckBox" runat="server" Checked='<%# Bind("Postar_Sexta") %>' />
                        <br />
                        Postar_Sabado:
                        <asp:CheckBox ID="Postar_SabadoCheckBox" runat="server" Checked='<%# Bind("Postar_Sabado") %>' />
                        <br />
                        Postar_Domingo:
                        <asp:CheckBox ID="Postar_DomingoCheckBox" runat="server" Checked='<%# Bind("Postar_Domingo") %>' />
                        <br />
                        <br />
                        Envio Total Enviar:
                        <br />
                        <asp:TextBox ID="Envio_Total_EnviarTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Envio_Total_Enviar") %>' />
                        <br />
                        Envio Total Enviado:
                        <br />
                        <asp:TextBox ID="Envio_Total_EnviadoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Envio_Total_Enviado") %>' />
                        <br />
                        Contador_Leitura:
                        <br />
                        <asp:TextBox ID="Contador_LeituraTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Contador_Leitura") %>' />
                        <br />
                        <br />
                        Activo:
                        <asp:CheckBox ID="flgActiveCheckBox" runat="server" Checked='<%# Bind("flgActive") %>' />
                        <br />
                        <br />
                        Data do último envio:
                        <br />
                        <asp:TextBox ID="Data_Ultimo_EnvioTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Data_Ultimo_Envio") %>' />
                        <br />
                        Criação:
                        <br />
                        <asp:TextBox ID="Data_CriacaoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Data_Criacao") %>' />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="button" Text="Salvar" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button" Text="Cancelar" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button" Text="Novo Mailing" />
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        Campanha:
                        <br />
                        <asp:TextBox ID="Nome_CampanhaTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Nome_Campanha") %>' />
                        <br />
                        Email Conta:
                        <br />
                        <asp:TextBox ID="Email_ContaTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Email_Conta") %>' />
                        <br />
                        Email Assunto:
                        <br />
                        <asp:TextBox ID="Email_AssuntoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Email_Assunto") %>' />
                        <br />
                        Email Corpo:
                        <br />
                        <asp:TextBox ID="Email_CorpoTextBox" runat="server" CssClass="InputCad" Height="100px" Text='<%# Bind("Email_Corpo") %>' TextMode="MultiLine" />
                        <br />
                        Envio Quantidade:
                        <br />
                        <asp:TextBox ID="Envio_QuantidadeTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Envio_Quantidade") %>' />
                        <br />
                        Hora Publicacao inicio:
                        <br />
                        <asp:TextBox ID="Hora_Publicacao_InicioTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Hora_Publicacao_Inicio") %>' />
                        <br />
                        Hora Publicacao Fim:
                        <br />
                        <asp:TextBox ID="Hora_Publicacao_FimTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Hora_Publicacao_Fim") %>' />
                        <br />
                        Envio Delay em Minutos:
                        <br />
                        <asp:TextBox ID="Envio_Delay_MinutosTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Envio_Delay_Minutos") %>' />
                        <br />
                        <br />
                        Postar_Segunda:
                        <asp:CheckBox ID="Postar_SegundaCheckBox" runat="server" Checked='<%# Bind("Postar_Segunda") %>' />
                        <br />
                        Postar_Terca:
                        <asp:CheckBox ID="Postar_TercaCheckBox" runat="server" Checked='<%# Bind("Postar_Terca") %>' />
                        <br />
                        Postar_Quarta:
                        <asp:CheckBox ID="Postar_QuartaCheckBox" runat="server" Checked='<%# Bind("Postar_Quarta") %>' />
                        <br />
                        Postar_Quinta:
                        <asp:CheckBox ID="Postar_QuintaCheckBox" runat="server" Checked='<%# Bind("Postar_Quinta") %>' />
                        <br />
                        Postar_Sexta:
                        <asp:CheckBox ID="Postar_SextaCheckBox" runat="server" Checked='<%# Bind("Postar_Sexta") %>' />
                        <br />
                        Postar_Sabado:
                        <asp:CheckBox ID="Postar_SabadoCheckBox" runat="server" Checked='<%# Bind("Postar_Sabado") %>' />
                        <br />
                        Postar_Domingo:
                        <asp:CheckBox ID="Postar_DomingoCheckBox" runat="server" Checked='<%# Bind("Postar_Domingo") %>' />
                        <br />
                        <br />
                        Envio Total Enviar:
                        <br />
                        <asp:TextBox ID="Envio_Total_EnviarTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Envio_Total_Enviar") %>' />
                        <br />
                        Envio Total Enviado:
                        <br />
                        <asp:TextBox ID="Envio_Total_EnviadoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Envio_Total_Enviado") %>' />
                        <br />
                        Contador_Leitura:
                        <br />
                        <asp:TextBox ID="Contador_LeituraTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Contador_Leitura") %>' />
                        <br />
                        <br />
                        Activo:
                        <asp:CheckBox ID="flgActiveCheckBox" runat="server" Checked='<%# Bind("flgActive") %>' />
                        <br />
                        <br />
                        Data do último envio:
                        <br />
                        <asp:TextBox ID="Data_Ultimo_EnvioTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Data_Ultimo_Envio") %>' />
                        <br />
                        Criação:
                        <br />
                        <asp:TextBox ID="Data_CriacaoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("Data_Criacao") %>' />
                        <br />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="button" Text="Salvar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Nome_CampanhaLabel" runat="server" Text='<%# Bind("Nome_Campanha") %>' />
                        <br />
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" CssClass="button" Text="Editar" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" CssClass="button" Text="Excluir" />
&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button" Text="Novo Mailing" />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <asp:GridView ID="GridViewCampanha" runat="server" AutoGenerateColumns="False" DataKeyNames="idCampanha" DataSourceID="SqlDataSourceListaMailing" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="idCampanha" HeaderText="idCampanha" InsertVisible="False" ReadOnly="True" SortExpression="idCampanha" Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="Nome_Campanha" HeaderText="Campanha" Text="Button" />
                        <asp:BoundField DataField="Nome_Campanha" HeaderText="Campanha" SortExpression="Nome_Campanha" Visible="False" />
                        <asp:BoundField DataField="Email_Conta" HeaderText="Conta" SortExpression="Email_Conta" />
                        <asp:BoundField DataField="Email_Assunto" HeaderText="Assunto" SortExpression="Email_Assunto" />
                        <asp:BoundField DataField="Email_Corpo" HeaderText="Email_Corpo" SortExpression="Email_Corpo" Visible="False" />
                        <asp:BoundField DataField="Envio_Quantidade" HeaderText="Quantidade" SortExpression="Envio_Quantidade" Visible="False" />
                        <asp:BoundField DataField="Hora_Publicacao_Inicio" HeaderText="Inicio" SortExpression="Hora_Publicacao_Inicio" Visible="False" />
                        <asp:BoundField DataField="Hora_Publicacao_Fim" HeaderText="Fim" SortExpression="Hora_Publicacao_Fim" Visible="False" />
                        <asp:BoundField DataField="Envio_Delay_Minutos" HeaderText="Envio_Delay_Minutos" SortExpression="Envio_Delay_Minutos" Visible="False" />
                        <asp:CheckBoxField DataField="Postar_Segunda" HeaderText="S" SortExpression="Postar_Segunda" />
                        <asp:CheckBoxField DataField="Postar_Terca" HeaderText="T" SortExpression="Postar_Terca" />
                        <asp:CheckBoxField DataField="Postar_Quarta" HeaderText="Q" SortExpression="Postar_Quarta" />
                        <asp:CheckBoxField DataField="Postar_Quinta" HeaderText="Q" SortExpression="Postar_Quinta" />
                        <asp:CheckBoxField DataField="Postar_Sexta" HeaderText="S" SortExpression="Postar_Sexta" />
                        <asp:CheckBoxField DataField="Postar_Sabado" HeaderText="S" SortExpression="Postar_Sabado" />
                        <asp:CheckBoxField DataField="Postar_Domingo" HeaderText="D" SortExpression="Postar_Domingo" />
                        <asp:BoundField DataField="Envio_Total_Enviar" HeaderText="Envio_Total_Enviar" SortExpression="Envio_Total_Enviar" Visible="False" />
                        <asp:BoundField DataField="Envio_Total_Enviado" HeaderText="Envio_Total_Enviado" SortExpression="Envio_Total_Enviado" Visible="False" />
                        <asp:BoundField DataField="Contador_Leitura" HeaderText="C" SortExpression="Contador_Leitura" />
                        <asp:CheckBoxField DataField="flgActive" HeaderText="flgActive" SortExpression="flgActive" Visible="False" />
                        <asp:BoundField DataField="Data_Ultimo_Envio" HeaderText="Data_Ultimo_Envio" SortExpression="Data_Ultimo_Envio" Visible="False" />
                        <asp:BoundField DataField="Data_Criacao" HeaderText="Data_Criacao" SortExpression="Data_Criacao" Visible="False" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceListaMailing" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB_Mailing %>" SelectCommand="SELECT [idCampanha], [Nome_Campanha], [Email_Conta], [Email_Assunto], [Email_Corpo], [Envio_Quantidade], [Hora_Publicacao_Inicio], [Hora_Publicacao_Fim], [Envio_Delay_Minutos], [Postar_Segunda], [Postar_Terca], [Postar_Quarta], [Postar_Quinta], [Postar_Sexta], [Postar_Sabado], [Postar_Domingo], [Envio_Total_Enviar], [Envio_Total_Enviado], [Contador_Leitura], [flgActive], [Data_Ultimo_Envio], [Data_Criacao] FROM [Campanha]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceFormMailing" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB_Mailing %>" DeleteCommand="DELETE FROM [Campanha] WHERE [idCampanha] = @idCampanha" InsertCommand="INSERT INTO [Campanha] ([Nome_Campanha], [Email_Conta], [Email_Assunto], [Email_Corpo], [Envio_Quantidade], [Hora_Publicacao_Inicio], [Hora_Publicacao_Fim], [Envio_Delay_Minutos], [Postar_Segunda], [Postar_Terca], [Postar_Quarta], [Postar_Quinta], [Postar_Sexta], [Postar_Sabado], [Postar_Domingo], [Envio_Total_Enviar], [Envio_Total_Enviado], [Contador_Leitura], [flgActive], [Data_Ultimo_Envio], [Data_Criacao]) VALUES (@Nome_Campanha, @Email_Conta, @Email_Assunto, @Email_Corpo, @Envio_Quantidade, @Hora_Publicacao_Inicio, @Hora_Publicacao_Fim, @Envio_Delay_Minutos, @Postar_Segunda, @Postar_Terca, @Postar_Quarta, @Postar_Quinta, @Postar_Sexta, @Postar_Sabado, @Postar_Domingo, @Envio_Total_Enviar, @Envio_Total_Enviado, @Contador_Leitura, @flgActive, @Data_Ultimo_Envio, @Data_Criacao)" SelectCommand="SELECT [idCampanha], [Nome_Campanha], [Email_Conta], [Email_Assunto], [Email_Corpo], [Envio_Quantidade], [Hora_Publicacao_Inicio], [Hora_Publicacao_Fim], [Envio_Delay_Minutos], [Postar_Segunda], [Postar_Terca], [Postar_Quarta], [Postar_Quinta], [Postar_Sexta], [Postar_Sabado], [Postar_Domingo], [Envio_Total_Enviar], [Envio_Total_Enviado], [Contador_Leitura], [flgActive], [Data_Ultimo_Envio], [Data_Criacao] FROM [Campanha] WHERE ([idCampanha] = @idCampanha)" UpdateCommand="UPDATE [Campanha] SET [Nome_Campanha] = @Nome_Campanha, [Email_Conta] = @Email_Conta, [Email_Assunto] = @Email_Assunto, [Email_Corpo] = @Email_Corpo, [Envio_Quantidade] = @Envio_Quantidade, [Hora_Publicacao_Inicio] = @Hora_Publicacao_Inicio, [Hora_Publicacao_Fim] = @Hora_Publicacao_Fim, [Envio_Delay_Minutos] = @Envio_Delay_Minutos, [Postar_Segunda] = @Postar_Segunda, [Postar_Terca] = @Postar_Terca, [Postar_Quarta] = @Postar_Quarta, [Postar_Quinta] = @Postar_Quinta, [Postar_Sexta] = @Postar_Sexta, [Postar_Sabado] = @Postar_Sabado, [Postar_Domingo] = @Postar_Domingo, [Envio_Total_Enviar] = @Envio_Total_Enviar, [Envio_Total_Enviado] = @Envio_Total_Enviado, [Contador_Leitura] = @Contador_Leitura, [flgActive] = @flgActive, [Data_Ultimo_Envio] = @Data_Ultimo_Envio, [Data_Criacao] = @Data_Criacao WHERE [idCampanha] = @idCampanha">
                    <DeleteParameters>
                        <asp:Parameter Name="idCampanha" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nome_Campanha" Type="String" />
                        <asp:Parameter Name="Email_Conta" Type="String" />
                        <asp:Parameter Name="Email_Assunto" Type="String" />
                        <asp:Parameter Name="Email_Corpo" Type="String" />
                        <asp:Parameter Name="Envio_Quantidade" Type="Int32" />
                        <asp:Parameter DbType="Time" Name="Hora_Publicacao_Inicio" />
                        <asp:Parameter DbType="Time" Name="Hora_Publicacao_Fim" />
                        <asp:Parameter Name="Envio_Delay_Minutos" Type="Int32" />
                        <asp:Parameter Name="Postar_Segunda" Type="Boolean" />
                        <asp:Parameter Name="Postar_Terca" Type="Boolean" />
                        <asp:Parameter Name="Postar_Quarta" Type="Boolean" />
                        <asp:Parameter Name="Postar_Quinta" Type="Boolean" />
                        <asp:Parameter Name="Postar_Sexta" Type="Boolean" />
                        <asp:Parameter Name="Postar_Sabado" Type="Boolean" />
                        <asp:Parameter Name="Postar_Domingo" Type="Boolean" />
                        <asp:Parameter Name="Envio_Total_Enviar" Type="Int32" />
                        <asp:Parameter Name="Envio_Total_Enviado" Type="Int32" />
                        <asp:Parameter Name="Contador_Leitura" Type="Int32" />
                        <asp:Parameter Name="flgActive" Type="Boolean" />
                        <asp:Parameter Name="Data_Ultimo_Envio" Type="DateTime" />
                        <asp:Parameter Name="Data_Criacao" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idCampanhaLabel" Name="idCampanha" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nome_Campanha" Type="String" />
                        <asp:Parameter Name="Email_Conta" Type="String" />
                        <asp:Parameter Name="Email_Assunto" Type="String" />
                        <asp:Parameter Name="Email_Corpo" Type="String" />
                        <asp:Parameter Name="Envio_Quantidade" Type="Int32" />
                        <asp:Parameter Name="Hora_Publicacao_Inicio" DbType="Time" />
                        <asp:Parameter DbType="Time" Name="Hora_Publicacao_Fim" />
                        <asp:Parameter Name="Envio_Delay_Minutos" Type="Int32" />
                        <asp:Parameter Name="Postar_Segunda" Type="Boolean" />
                        <asp:Parameter Name="Postar_Terca" Type="Boolean" />
                        <asp:Parameter Name="Postar_Quarta" Type="Boolean" />
                        <asp:Parameter Name="Postar_Quinta" Type="Boolean" />
                        <asp:Parameter Name="Postar_Sexta" Type="Boolean" />
                        <asp:Parameter Name="Postar_Sabado" Type="Boolean" />
                        <asp:Parameter Name="Postar_Domingo" Type="Boolean" />
                        <asp:Parameter Name="Envio_Total_Enviar" Type="Int32" />
                        <asp:Parameter Name="Envio_Total_Enviado" Type="Int32" />
                        <asp:Parameter Name="Contador_Leitura" Type="Int32" />
                        <asp:Parameter Name="flgActive" Type="Boolean" />
                        <asp:Parameter Name="Data_Ultimo_Envio" Type="DateTime" />
                        <asp:Parameter Name="Data_Criacao" Type="DateTime" />
                        <asp:Parameter Name="idCampanha" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

