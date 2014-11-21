{include file="header.tpl"}

<!--Main Start-->

<div id="main">

<div class="content container">
    <div class="row">
        <div class="left col-md-9 col-sm-12 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading ">{l t='Reset Password'}</div>
                <div class="panel-body">
                    {if $var_notice!=''}
                    {$var_notice}
                    {else}
                    <div>
                        <form action="?f=submit" method="post">
                            <h4>{l t='To reset your password, please fill the blanks below:'}</h4>
                            <br>
                            <div class="form-group">
                                <label for="email" class="col-md-5 col-sm-5 col-xs-6   control-label">{l t='Email Address'}:</label>
                                <div class="col-md-7 col-sm-7 col-xs-12 ">
                                    <input type="text" class="form-control" name="email" id="email" />
                                    <br>
                                </div>
                            </div>

                            <div class="form-group">
                            <label for="r" class="col-md-5 col-sm-5 col-xs-12  control-label">{l t='Secure Code'}:</label>
                                <div class="col-md-5 col-sm-5 col-xs-6 ">
                                    <input name="r" id="r" class="form-control" type="text" />
                                </div>
                                <img src="/inc/func/auth_img.php" class="img-responsive col-xs-3 col-sm-2 pull-left" />
                                <div class="clearfix"></div>
                            </div>


                            <div class="col-md-5 col-sm-5"></div>
                            <div class="form-group">
                                <div class="col-md-2 col-sm-2 col-xs-4">
                                    <button type="submit " name="button" id="button" class="btn btn-default btn-block button-blue" value="   {l t='Send'} &gt;&gt;   " onclick="this.disabled=true; form.submit()" />Send</button>
                                </div>
                            </div>

                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr style="display:none;">
                                    <td height="40"><h3>{l t='Birthdate'} </h3></td>
                                    <td height="40"><select name="month" class="reg_month">
                                            <option value="00" selected="selected">---</option>
                                            <option value="01">{l t='Jan'}</option>
                                            <option value="02">{l t='Feb'}</option>
                                            <option value="03">{l t='Mar'}</option>
                                            <option value="04">{l t='Apr'}</option>
                                            <option value="05">{l t='May'}</option>
                                            <option value="06">{l t='Jun'}</option>
                                            <option value="07">{l t='Jul'}</option>
                                            <option value="08">{l t='Aug'}</option>
                                            <option value="09">{l t='Sep'}</option>
                                            <option value="10">{l t='Oct'}</option>
                                            <option value="11">{l t='Nov'}</option>
                                            <option value="12">{l t='Dec'}</option>
                                        </select>
                                        <span class="reg_month">{l t='Month'} </span>
                                        <select name="day" class="reg_day">
                                            <option value="00" selected="selected">--</option>
                                            <option value="01">1</option>
                                            <option value="02">2</option>
                                            <option value="03">3</option>
                                            <option value="04">4</option>
                                            <option value="05">5</option>
                                            <option value="06">6</option>
                                            <option value="07">7</option>
                                            <option value="08">8</option>
                                            <option value="09">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                            <option value="13">13</option>
                                            <option value="14">14</option>
                                            <option value="15">15</option>
                                            <option value="16">16</option>
                                            <option value="17">17</option>
                                            <option value="18">18</option>
                                            <option value="19">19</option>
                                            <option value="20">20</option>
                                            <option value="21">21</option>
                                            <option value="22">22</option>
                                            <option value="23">23</option>
                                            <option value="24">24</option>
                                            <option value="25">25</option>
                                            <option value="26">26</option>
                                            <option value="27">27</option>
                                            <option value="28">28</option>
                                            <option value="29">29</option>
                                            <option value="30">30</option>
                                            <option value="31">31</option>
                                        </select>
                                        <span class="reg_day">{l t='Day'} </span>
                                        <select name="year" class="reg_year" >
                                            <option value="0000" selected="selected">----</option>
                                            {php}
                                                for($i=date(Y); $i>=1901; $i--)
                                                {
                                                echo "<option value=\"".$i."\">$i</option>";
                                                }
                                            {/php}
                                        </select>
                                        <span class="reg_year">{l t='Year'} </span></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            {/if}
        </div>

        <div class="right col-md-3 hidden-sm hidden-xs" >
            <div style="text-align:center;">
            <p align="center">
                {$ads->getAdCode(3)}
            </p>
            </div>
        </div>
    </div>
</div>
</div>
<!--Main End-->
{include file="footer.tpl"}
