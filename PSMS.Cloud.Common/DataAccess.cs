using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Collections;

namespace PSMS.Cloud.Common
{
    public class DataAccess : IDisposable
    {
        private bool disposed = false;
        private SqlConnection conn = null;
        private SqlTransaction tran = null;
        private bool beginTran = false;
        private IsolationLevel isolationLevel;


        public static string GetConnectionString()
        {
            
            string ConnectionStr = CommonConfig.GetParam("DBConnectionString");
            return ConnectionStr;
            
        }

        public void BeginTransaction()
        {
            isolationLevel = IsolationLevel.Unspecified;
            beginTran = true;
        }

        public void BeginTransaction(IsolationLevel iso)
        {
            isolationLevel = iso;
            beginTran = true;
        }

        private void OpenConnection()
        {
            if (conn == null)
            {
                conn = new SqlConnection();
                conn.ConnectionString = GetConnectionString();
                conn.Open();

                if (beginTran)
                {
                    tran = conn.BeginTransaction(isolationLevel);
                    beginTran = false;
                }
                else
                {
                    tran = null;
                    return;
                }
            }
        }

        public void CommitTransaction()
        {
            if (tran != null)
            {
                tran.Commit();
                tran.Dispose();
            }
            beginTran = false;
            tran = null;
        }

        public void RollBackTransaction()
        {
            if (tran != null)
            {
                tran.Rollback();
                tran.Dispose();
            }
            beginTran = false;
            tran = null;
        }

        public void Close()
        {
            if (conn != null)
            {
                conn.Close();
                conn = null;
            }

            if (tran != null)
            {
                tran.Dispose();
                tran = null;
            }
            beginTran = false;
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!disposed)
            {
                if (disposing)
                {
                    if (tran != null)
                    {
                        tran.Dispose();
                        tran = null;
                    }
                    if (conn != null)
                    {
                        if (conn.State != ConnectionState.Closed)
                        {
                            conn.Close();
                        }
                        conn.Dispose();
                        conn = null;
                    }
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public DataSet RunProcDS(string storedProcName)
        {
            OpenConnection();
            DataSet ds = null;
            if (tran != null)
            {
                ds = SqlHelper.ExecuteDataset(tran, CommandType.StoredProcedure, storedProcName);
            }
            else
            {
                ds = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, storedProcName);
                this.Close();
            }
            return ds;
        }

        public DataSet RunProcDS(string storedProcName, List<SqlParameter> parameterValues)
        {
            OpenConnection();

            DataSet ds = null;
            if (tran != null)
            {
                ds = SqlHelper.ExecuteDataset(tran, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
            }
            else
            {
                ds = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
                this.Close();
            }
            return ds;
        }

        public DataTable RunProcDT(string storedProcName)
        {
            DataSet ds;
            OpenConnection();
            if (tran != null)
            {
                ds = SqlHelper.ExecuteDataset(tran, CommandType.StoredProcedure, storedProcName);
            }
            else
            {
                ds = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, storedProcName);
                this.Close();
            }


            if (ds.Tables.Count > 0)
            {
                return ds.Tables[0];
            }
            else
                return null;
        }

        public DataTable RunProcDT(string storedProcName, List<SqlParameter> parameterValues)
        {
            DataSet ds = null;
            OpenConnection();
            if (tran != null)
            {
                ds = SqlHelper.ExecuteDataset(tran, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
            }
            else
            {
                ds = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
                this.Close();
            }

            if (ds.Tables.Count > 0)
            {
                return ds.Tables[0];
            }
            else
                return null;
        }


        public int RunProcReturnIdentity(string storedProcName, List<SqlParameter> parameterValues)
        {
            object result;
            OpenConnection();
            if (tran != null)
            {
                result = SqlHelper.ExecuteScalar(tran, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
            }
            else
            {
                result = SqlHelper.ExecuteScalar(conn, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
                this.Close();
            }
            if (result != null)
                return Convert.ToInt32(result);
            else
                return -1;
        }


        public long RunProcReturnLongIdentity(string storedProcName, List<SqlParameter> parameterValues)
        {
            object result;
            OpenConnection();
            if (tran != null)
            {
                result = SqlHelper.ExecuteScalar(tran, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
            }
            else
            {

                result = SqlHelper.ExecuteScalar(conn, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
                this.Close();
            }
            if (result != null)
                return Convert.ToInt64(result);
            else
                return -1;
        }

        public object RunProcReturnScalar(string storedProcName, List<SqlParameter> parameterValues)
        {
            OpenConnection();
            object result = null;
            if (tran != null)
            {
                result = SqlHelper.ExecuteScalar(tran, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
            }
            else
            {
                result = SqlHelper.ExecuteScalar(conn, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
                this.Close();
            }
            return result;
        }

        public void RunProc(string storedProcName, List<SqlParameter> parameterValues)
        {
            OpenConnection();
            if (tran != null)
            {
                SqlHelper.ExecuteNonQuery(tran, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
            }
            else
            {
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, storedProcName, parameterValues.ToArray());
                this.Close();
            }
        }


        public DataAccess()
        {

        }
    }
}
