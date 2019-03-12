using System;
using System.Text;
using System.Security.Cryptography;

namespace ConsoleApplication3
{
    class Program
    {
        static void Main(string[] args)
        {
            int i = 0;
            while(true)
            {
                i++;
                // given, a password in a string
                string password = @"iwrupvqb" + i;

                // byte array representation of that string
                byte[] encodedPassword = new UTF8Encoding().GetBytes(password);

                // need MD5 to calculate the hash
                byte[] hash = ((HashAlgorithm)CryptoConfig.CreateFromName("MD5")).ComputeHash(encodedPassword);

                // string representation (similar to UNIX format)
                string encoded = BitConverter.ToString(hash)
                    // without dashes
                   .Replace("-", string.Empty)
                    // make lowercase
                   .ToLower();

                // encoded contains the hash you are wanting
                if (encoded.Substring(0, 6) == "000000")
                {
                    Console.WriteLine(i);
                    break;
                }  
            } 
            Console.ReadKey();           
        }
    }
}
