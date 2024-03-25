﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
using negocio;

namespace negocio
{
    public class TraineeNegocio
    {
        public void Actualizar(Trainee user)
        {
            AccesoDatos datos = new AccesoDatos();

            try
			{
				datos.setearConsulta("update USERS set imagenPerfil = @imagen, nombre = @nombre, apellido = @apellido, fechaNacimiento = @fecha where id = @id");
				datos.setearParametro("@imagen", user.ImagenPerfil != null ? user.ImagenPerfil : (object)DBNull.Value);
                datos.setearParametro("@nombre", user.Nombre);
                datos.setearParametro("@apellido", user.Apellido);
                datos.setearParametro("@fecha", user.FechaNacimiento);
                datos.setearParametro("@id", user.Id);
				datos.ejecutarAccion();

				

			}
			catch (Exception ex)
			{

				throw ex;
			}
			finally
			{
				datos.cerrarConexion();
			}
        }

        public int insertarNuevo(Trainee nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
			{
				datos.setearProcedimiento("InsertarNuevo");
				datos.setearParametro("@email", nuevo.Email);
				datos.setearParametro("@pass", nuevo.Pass);
				return datos.ejecutarAccionScalar();

			}
			catch (Exception)
			{

				throw;
			}
			finally
			{
				datos.cerrarConexion();
			}
        }

		public bool Login(Trainee trainee)
		{

			AccesoDatos datos = new AccesoDatos();

			try
			{
				datos.setearConsulta("Select id, email, pass, admin, imagenPerfil, nombre, apellido, fechaNacimiento from USERS where email = @email and pass = @pass");
				datos.setearParametro("@email", trainee.Email);
				datos.setearParametro("@pass", trainee.Pass);
                
                datos.ejecutarLectura();
				
				if (datos.Lector.Read())
				{
					trainee.Id = (int)datos.Lector["Id"];
					trainee.Admin = (bool)datos.Lector["admin"];
					if(!(datos.Lector["imagenPerfil"] is DBNull))
                        trainee.ImagenPerfil = (String)datos.Lector["imagenPerfil"];
                    if (!(datos.Lector["nombre"] is DBNull))
                        trainee.Nombre = (String)datos.Lector["nombre"];
                    if (!(datos.Lector["apellido"] is DBNull))
                        trainee.Apellido = (String)datos.Lector["apellido"];
                    if (!(datos.Lector["fechaNacimiento"] is DBNull))
                        trainee.FechaNacimiento = DateTime.Parse(datos.Lector["fechaNacimiento"].ToString());
                    return true;
				}

				return false;
			}
			catch (Exception ex)
			{

				throw ex;
			}
			finally
			{
				datos.cerrarConexion();
			}
		}
    }
}
