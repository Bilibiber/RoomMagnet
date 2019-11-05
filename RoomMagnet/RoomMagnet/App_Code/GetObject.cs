using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Amazon.S3;
using Amazon.S3.Model;
using System.IO;
using System.Threading.Tasks;
using Amazon;

public class GetObject
{
    //private string bucketName = "*** bucket name ***";
   ///string keyName = "*** object key ***";
    // Specify your bucket region (an example region is shown).
    private static readonly RegionEndpoint bucketRegion = RegionEndpoint.USWest2;
    private static IAmazonS3 client;

    public void RequestItem(string objectName)
    {
        string bucketName = "property-created";
        string keyName = bucketName+ "\\"+ "Property Pictures\\"+ objectName ;
    client = new AmazonS3Client(bucketRegion);
        ReadObjectDataAsync(bucketName, keyName).Wait();
    }

    static async Task ReadObjectDataAsync(string bucketName, string keyName)
    {
        string responseBody = "";
        try
        {
            GetObjectRequest request = new GetObjectRequest
            {
                BucketName = bucketName,
                Key = keyName
            };
            using (GetObjectResponse response = await client.GetObjectAsync(request))
            using (Stream responseStream = response.ResponseStream)
            using (StreamReader reader = new StreamReader(responseStream))
            {
                string title = response.Metadata["x-amz-meta-title"]; // Assume you have "title" as medata added to the object.
                string contentType = response.Headers["Content-Type"];
                Console.WriteLine("Object metadata, Title: {0}", title);
                Console.WriteLine("Content type: {0}", contentType);

                responseBody = reader.ReadToEnd(); // Now you process the response body.
            }
        }
        catch (AmazonS3Exception e)
        {
            Console.WriteLine("Error encountered ***. Message:'{0}' when writing an object", e.Message);
        }
        catch (Exception e)
        {
            Console.WriteLine("Unknown encountered on server. Message:'{0}' when writing an object", e.Message);
        }
    }
    public GetObject()
    {

    }
}
