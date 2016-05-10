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
                    <form method="POST" name="emeterLoginForm" id="emeterLoginForm" action="/emetering/login">
                        <div class="sidebarstd">
                            <b>User ID</b>
                            <input type="text" name="UserID" id="UserID" />
                        </div>
                        <div class="sidebarstd">
                            <b>Password</b>
                            <input type="password" name="password" id="password" />
                        </div>
                        <div class="sidebarstd" align="right">
                            <input type="submit" id="loginButton" value="Submit" />
                            <br>
                        </div>
                        <%--<input type="hidden" name="width" />--%>
                        <%--<input type="hidden" name="height" />--%>
                        <%--<input type="hidden" name="browser" />--%>
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

</html>