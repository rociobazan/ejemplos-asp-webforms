﻿using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pokedex_web
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!(Page is Login || Page is Default || Page is Registro))
            {
                if (!Seguridad.sesionActiva(Session["trainee"]))
                {
                    Response.Redirect("Login.aspx", false);
                }
            }
        }
    }
}