{include file="header.tpl"}

<div id="main">
    <div class="content">
        <div class="container">
            <div class="row">
                <br/>

                <div class="col-lg-3 hidden-md hidden-sm hidden-xs text-center" >
                    {$ads->getAdCode(10)}
                </div>

                {if $var_f!='info'}
                <div class="col-lg-6 col-md-8 col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Contact us'}</h3>
                        </div>
                        <div class="panel-body">
                            <form action="?f=send" method="post">
                                <div id="contactForm">
                                    <p>{l t='For feedback us, please fill out the form below:'}</p>
                                    <p id="topics-paragraph">
                                        <label for="topic">{l t='Topic'}:</label>
                                        <br />
                                        <div class="row col-md-12">
                                        <select class="form-control" id="topic" name="topic">
                                            <option value="Unselected" selected="selected">{l t='Select topic'}</option>
                                            <option>{l t='Advertise'}</option>
                                            <option>{l t='Bugs'}</option>
                                            <option>{l t='Business Development'}</option>
                                            <option>{l t='Duplicate business listing'}</option>
                                            <option>{l t='Employment'}</option>
                                            <option>{l t='Help me use'}</option>
                                            <option>{l t='Ideas to improve'}</option>
                                            <option>{l t='New categories suggestion'}</option>
                                            <option>{l t='Out of date business listing'}</option>
                                            <option>{l t='Press'}</option>
                                            <option>{l t='Suggest a Business Listing'}</option>
                                            <option>{l t='Questionable content'}</option>
                                            <option>{l t='Other'}</option>
                                        </select>
                                        </div>
                                    </p>
                                    <div class="clearfix"></div>
                                    <br/>
                                    <p id="subtopic-paragraph">
                                        <label for="contact-name">{l t='Your name'}:</label>
                                        <br />
                                        <div class="row col-md-12">
                                            <input type="text" class="form-control" id="contact-name" name="contact_name" />
                                        </div>
                                    </p>
                                    <div class="clearfix"></div>
                                    <br/>
                                    <p id="email-paragraph">
                                        <label for="contact_email">{l t='Your email address'}:</label>
                                        <br />
                                        <div class="row col-md-12">
                                        <input type="email" class="form-control" id="contact_email" maxlength="64" name="contact_email" />
                                        </div>
                                    </p>
                                    <div class="clearfix"></div>
                                    <br/>
                                    <p id="comments-paragraph">
                                        <label comments>{l t='Comments'} </label>
                                        <br />
                                        <div class="row col-md-12">
                                        <textarea class="form-control" id="comments" name="comments" rows="10" cols="40"></textarea>
                                        </div>
                                    </p>
                                    <div class="clearfix"></div>
                                    <br/>
                                    <p id="submit-paragraph">
                                        <div class="text-center">

                                                <input type="submit" class="btn button-blue" name="button" id="button" value="{l t='Submit'}" onclick="this.disabled=true;form.submit();">

                                        </div>
                                        <br />
                                    </p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                {else}
                    <div class="col-md-6 col-sm-6 text-center" >
                        <h1>&nbsp;</h1>
                        <h1>&nbsp;</h1>
                        <h1>&nbsp;</h1>
                        <h1>{l t='Thank you for contacting us!'}</h1>
                        <h1>{l t='We will reply your feedback soon!'}</h1>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                    </div>
                {/if}

                <div class="col-lg-3 col-md-2 col-sm-2 text-center" >
                    {$ads->getAdCode(10)}
                </div>
            </div>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}
