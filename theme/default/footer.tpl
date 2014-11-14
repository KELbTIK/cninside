 <!--Footer Start-->
 <div id="footer">
<p>&copy; {$smarty.now|date_format:"%Y"} {$smarty.const._SITENAME_} - <a href="/page.php?page=privacy" target="_blank">{l t='Privacy Policy'}</a> - <a href="/page.php?page=terms" target="_blank">{l t='Terms of Service'}</a> - <a href="/contact/">{l t='Contact'}</a>


     
<!--Powered by MeePlace.com.  Please keep, thank you.-->
    <span id="meeplace_mark" class="pull-right"> {l t='Powered by'}: <a href="http://www.MeePlace.com" target="_blank">MeePlace</a></span>
</p>

</div>
 <!--Footer End-->
</div> 




{if $smarty.const._TRACKER_GOOGLE_ANALYTICS_UA_}        
<!-- Tracking script -->
		<script type="text/javascript"> 
		var UA="{$smarty.const._TRACKER_GOOGLE_ANALYTICS_UA_}";
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script> 
        {literal}
        <script type="text/javascript"> 
        try{
        var pageTracker = _gat._getTracker(UA);
        pageTracker._trackPageview();
        } catch(err) {}
        </script>
        {/literal}
{/if}



</body>
</html>