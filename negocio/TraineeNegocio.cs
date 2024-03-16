using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class TraineeNegocio
    {
		AccesoDatos datos = new AccesoDatos();
        public int insertarNuevo(Trainee nuevo)
        {
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
    }
}
