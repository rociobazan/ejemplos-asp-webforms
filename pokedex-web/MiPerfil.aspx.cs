﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace pokedex_web
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if ((Seguridad.sesionActiva(Session["trainee"])))
                {
                    try
                    {
                        Trainee user = (Trainee)Session["Trainee"];

                        txtEmail.Text = user.Email;
                        txtEmail.ReadOnly = true;
                        txtNombre.Text = user.Nombre;
                        txtApellido.Text = user.Apellido;
                        txtFechaNacimiento.Text = user.FechaNacimiento.ToString("yyyy-MM-dd");

                        if (!string.IsNullOrEmpty(user.ImagenPerfil))
                            imgNuevoPerfil.ImageUrl = "~/Images/" + user.ImagenPerfil;
                    }
                    catch (Exception ex)
                    {

                        Session.Add("Error", Seguridad.manejoDeError(ex));
                        Response.Redirect("Error.aspx", false);
                    }
                }
            }
            
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {

                Page.Validate();
                if (!Page.IsValid)
                    return;

                TraineeNegocio negocio = new TraineeNegocio();
                Trainee user = (Trainee)Session["Trainee"];

                //Escribir imagen solo si se le cargo algo
                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Images/");
                    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + user.Id + ".jpg");
                    user.ImagenPerfil = "perfil-" + user.Id + ".jpg";
                }

                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);

                //guardar datos perfil
                negocio.Actualizar(user);

                //Leer imagen
                Image img = (Image)Master.FindControl("imgAvatar");
                img.ImageUrl = "~/images/" + user.ImagenPerfil;
                
            }
            catch (Exception ex)
            {

                Session.Add("Error", Seguridad.manejoDeError(ex));
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}