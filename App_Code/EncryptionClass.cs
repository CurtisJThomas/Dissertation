using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for EncryptionClass
/// </summary>
public class EncryptionClass
{
    public EncryptionClass()
    {
    }

    public static string encryptText(string text)
    {
        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
        md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));
        byte[] result = md5.Hash;
        StringBuilder str = new StringBuilder();
        for (int i = 0; i < result.Length; i++)
        {
            str.Append(result[i].ToString("x2"));
        }
        return str.ToString();
    }

    //Method used to Decrypt 
    public static Boolean Decrypt(string encryped, string input)
    {
        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
        md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(encryped));
        byte[] result = md5.Hash;
        StringBuilder str = new StringBuilder();
        for (int i = 0; i < result.Length; i++)
        {
            str.Append(result[i].ToString("x2"));
        }
        return str.ToString().Equals(encryped);
    }
}