using System.Xml.Linq;
using System.IO;

Console.WriteLine("Examples taken from here: https://learn.microsoft.com/en-us/dotnet/api/system.xml.linq.xelement?view=net-7.0");

var xml =
    new XElement("Something",
        new XAttribute("Att", "s"),
        new XAttribute("Att2", "gg"),
        new XElement("AnotherSomething"),
        new XElement("AnotherSomething"));

File.WriteAllText("something.xml", xml.ToString());
var fileText = File.ReadAllText("something.xml");

Console.WriteLine(fileText);
