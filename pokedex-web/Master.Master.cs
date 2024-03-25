using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace pokedex_web
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AccesoDatos datos = new AccesoDatos();

            imgAvatar.ImageUrl = "https://img.freepik.com/vector-premium/icono-cuenta-icono-usuario-graficos-vectoriales_292645-552.jpg?w=740";
            
            if (!(Page is Login || Page is Default || Page is Registro || Page is Error))
            {
                if (!Seguridad.sesionActiva(Session["trainee"]))
                {
                    Response.Redirect("Login.aspx", false);
                }
                else
                {
                    Trainee user = (Trainee)Session["trainee"];
                    lblUser.Text = user.Email;
                    if (!string.IsNullOrEmpty(user.ImagenPerfil))
                        imgAvatar.ImageUrl = "~/images/" + user.ImagenPerfil;
                }

            }
 
                
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}