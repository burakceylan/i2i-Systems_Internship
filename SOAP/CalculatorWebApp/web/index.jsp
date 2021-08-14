<html>
    <head>
        <title>Calculator</title>
        <script type="text/javascript">
            function Req() {
                let n1 = document.getElementById("n1").value;
                let n2 = document.getElementById("n2").value;
                let op = document.getElementById("op").value;
                var str = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:com="http://com/">' +
                        '<soapenv:Header/>' +
                        '<soapenv:Body>' +
                        '<com:' + op + '>' +
                        '<number1>' + n1 + '</number1>' +
                        '<number2>' + n2 + '</number2>' +
                        '</com:' + op + '>' +
                        '</soapenv:Body>' +
                        '</soapenv:Envelope>';
                function createCORSRequest(method, url) {
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {
                        xhr.open(method, url, false);
                    } else if (typeof XDomainRequest != "undefined") {
                        alert
                        xhr = new XDomainRequest();
                        xhr.open(method, url);
                    } else {
                        console.log("CORS not supported");
                        alert("CORS not supported");
                        xhr = null;
                    }
                    return xhr;
                }
                var xhr = createCORSRequest("POST", "http://localhost:8080/CalculatorWebApp/CalculatorServiceService");
                if (!xhr) {
                    console.log("XHR issue");
                    return;
                }

                xhr.onload = function () {
                    var results = xhr.responseText;
                    if (window.DOMParser)
                    {
                        parser = new DOMParser();
                        xmlDoc = parser.parseFromString(results, "text/xml");
                        // alert(xmlDoc.getElementsByTagName("return")[0].childNodes[0].nodeValue);
                        if (xmlDoc.getElementsByTagName("faultstring")[0]) {
                            document.getElementById("out").value = "Infinite"
                        } else {
                            document.getElementById("out").value = xmlDoc.getElementsByTagName("return")[0].childNodes[0].nodeValue;
                        }
                    } else // Internet Explorer
                    {
                        xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                        xmlDoc.async = false;
                        xmlDoc.loadXML(results);
                        //alert(xmlDoc.getElementsByTagName("return")[0].childNodes[0].nodeValue);
                        if (xmlDoc.getElementsByTagName("faultstring")[0]) {
                            document.getElementById("out").value = "Infinite"
                        } else {
                            document.getElementById("out").value = xmlDoc.getElementsByTagName("return")[0].childNodes[0].nodeValue;
                        }
                    }
                    //alert(results);
                    //console.log(results);
                }

                xhr.setRequestHeader('Content-Type', 'text/xml');
                xhr.send(str);
            }

        </script>
    </head>
    <body>
        <form name="Demo" action="" method="post">
            <div>
                <input type="text" id="n1"/>
                <input type="text" id="n2"/>
                <select id="op">
                    <option value="divide">divide</option>
                    <option value="multiply">multiply</option>
                    <option value="sum">sum</option>
                    <option value="substract">subtract</option> 
                </select>
                <input type="button" value="Calc" onclick="Req()" />
                <br></br>
                <label> Result:</label>
                <output  id="out"/>
            </div>
        </form>
    </body>
</html>