using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace pokedex_web
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Trainee user = new Trainee();
                TraineeNegocio traineeNegocio = new TraineeNegocio();
                EmailService emailService = new EmailService();
                user.Email = txtEmail.Text;
                user.Pass = txtPassword.Text;
                user.Id = traineeNegocio.insertarNuevo(user);

                Session.Add("trainee", user);

                
                emailService.armarCorreo(user.Email, "Bienvedid@, trainee", "te damos la bienvenida a la mejor de las mejores app pokemon :D. Gracias por registrarte, tkm, tkm <3");
                emailService.enviarEmail();

                
                Response.Redirect("default.aspx", false);

            }
            catch (Exception ex)
            {

                Session.Add("Error", Seguridad.manejoDeError(ex));
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}