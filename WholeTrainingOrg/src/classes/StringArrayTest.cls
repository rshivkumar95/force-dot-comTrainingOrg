public class StringArrayTest
{
    
    public static List<String> generateStringArray(integer n)
    {
        List<String> data=new List<String>();
        
        for(integer i=0;i<n;i++)
            data.add('Test '+i);
        
        return data;
    }


}