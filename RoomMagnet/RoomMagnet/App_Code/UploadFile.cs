using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Amazon.S3;
using Amazon.S3.Transfer;
using System.Threading.Tasks;
using System.IO;
using Amazon;

public class UploadFile
{

    // Specify your bucket region (an example region is shown).
    private static readonly RegionEndpoint bucketRegion = RegionEndpoint.USWest2;
    private static IAmazonS3 s3Client;

    public void UploadItem(string bucketName, string filePath)
    {
        s3Client = new AmazonS3Client(bucketRegion);
        UploadFileAsync(bucketName, filePath).Wait();
    }

    private static async Task UploadFileAsync(string bucketName, string filePath)
    {
        try
        {
            var fileTransferUtility =
                new TransferUtility(s3Client);

            // Option 1. Upload a file. The file name is used as the object key name.
            await fileTransferUtility.UploadAsync(filePath, bucketName);
            

        }
        catch (AmazonS3Exception e)
        {
            Console.WriteLine("Error encountered on server. Message:'{0}' when writing an object", e.Message);
        }
        catch (Exception e)
        {
            Console.WriteLine("Unknown encountered on server. Message:'{0}' when writing an object", e.Message);
        }

    }
}

