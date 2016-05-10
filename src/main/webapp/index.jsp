<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>BC Hydro - eMetering</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="Content-Language" content="en-us" />
    <meta http-equiv="imagetoolbar" content="false" />
    <meta name="MSSmartTagsPreventParsing" content="true" />
    <meta name="robots" content="all" />
    <meta name="copyright" content="Copyright (c) 2008 BC Hydro" />

    <link rel="stylesheet" type="text/css" media="all" href="includes/css/interim_extranet_apps.css" />


    <script src="scripts/jquery-1.12.3.min.js" type="text/javascript">
    </script>


</head>

<body>
    <div id="container">
        <div id="header">
            <IMG alt=BChydro src="includes/img/BC_Hydro_logo.png">
        </div>
        <!-- /end #header -->

        <div id="bodyWrapper">
            <div id="sideBar">
                <div id="sideNav">
                    <h4>Registered User</h4>
                    <div class="sidebarstd">
                        Already an eMetering user?
                        <br /> Log in below.
                    </div>
                    <form method="POST" name="emeterLoginForm" id="emeterLoginForm" action="/">
                        <div class="sidebarstd">
                            <b>User ID</b>
                            <input type="text" name="UserID" id="UserID" />
                        </div>
                        <div class="sidebarstd">
                            <b>Password</b>
                            <input type="password" name="password" id="password" />
                        </div>
                        <div class="sidebarstd" align="right">
                            <!-- 		<input name="request" type="submit" class="submitCancel"
								id="ajax" value="Login" /><br />  -->
                            <!--                                                        <input type="button" id="loginButton" value="Login" onclick="callOtherDomain()" />-->
                            <input type="button" id="loginButton" value="Login" />

                            <br>
                        </div>
                        <input type="hidden" name="width" />
                        <input type="hidden" name="height" />
                        <input type="hidden" name="browser" />
                    </form>
                    <div id="demo"></div>
                </div>
            </div>
            <!-- /end #sideNav -->
        </div>
        <!-- /end #sideBar -->

        <div id="bcMain">
            <div id="bodyContent">
                <h1 style="text-transform: none;">Power Smart eMetering</h1>
                <div id="bcLeftCol">
                    <div id="Application">
                        <p>BC Hydro's Power Smart e.Metering allows you to read the interval data from your BC Hydro revenue meter.</p>
                        <p>
                            <a href="http://www.bchydro.com/powersmart/business.html">More
								about Energy Savings Programs</a>
                        </p>
                        <p>
                            <b>Forgot your User ID / Password?</b>
                            <br /> eMail: transmission.billing@bchydro.com
                            <br />
                    </div>
                    <!-- /end #Application -->
                </div>
                <div id="rightBar">
                    <div class="dialog">
                        <div class="hd">
                            <div class="c"></div>
                        </div>
                        <div class="bd">
                            <div class="c">
                                <div class="s">
                                    <h2>Quick Tip</h2>
                                    <p>In eMetering all metering times go to 12:00 a.m. Pacific Standard Time.</p>
                                </div>
                            </div>
                        </div>
                        <div class="ft">
                            <div class="c"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /end #bodyContent -->
        </div>
        <!-- /end #bcMain -->
    </div>
    <!-- /end #bodyWrapper -->
    </div>
</body>
<script>
    var form_data;
    $(document).ready(function () {
        $("#loginButton").click(function () {
            makeCorsRequest();
        });
    });

    //   
    // Create the XHR object.
    function createCORSRequest(method, url) {
        var xhr = new XMLHttpRequest();
        if ("withCredentials" in xhr) {
            // XHR for Chrome/Firefox/Opera/Safari.
            xhr.open(method, url, true);
        } else if (typeof XDomainRequest != "undefined") {
            // XDomainRequest for IE.
            xhr = new XDomainRequest();
            xhr.open(method, url);
        } else {
            // CORS not supported.
            xhr = null;
        }
        xhr.setRequestHeader('Access-Control-Request-Headers', 'origin, content-type, Accept');
        return xhr;
    }


    // Make the actual CORS request.
    function makeCorsRequest() {
        form_data = new FormData($('#emeterLoginForm')[0]);

        // All HTML5 Rocks properties support CORS.
        var url = 'https://kdcbchemdrweb2.bchydro.bc.ca/eMeterRestWebApi/api/DemandResponseIsUser';

        var xhr = createCORSRequest('POST', url);
        if (!xhr) {
            alert('CORS not supported');
            return;
        }

        // Response handlers.
        xhr.onload = function () {
            var text = xhr.responseText;
            alert('Response from CORS request to ' + text);
        };

        xhr.onerror = function () {
            alert('Woops, there was an error making the request.');
        };

        xhr.send(form_data);
    }
</script>

</html>