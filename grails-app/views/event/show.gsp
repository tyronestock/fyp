<%@ page import="fyp.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'livestream.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'event.css')}" />
		<rateable:resources/>
	</head>
	<body>
		<div id="show-event" class="col-md-8 content scaffold-show" role="main">	
			<div class="event-title">
				<!-- ARTIST -->
				<div>
					<g:if test="${eventInstance?.artist}">
						<span class="property-value artist-name" id = "artistName" aria-labelledby="artist-label">
							<g:fieldValue bean="${eventInstance}" field="artist"/>
						</span>
					</g:if>
				</div>

				<!-- VENUE -->
				<div>
					<g:if test="${eventInstance?.venue}">
						<span class="property-value venue-name" id = "venueName" aria-labelledby="venue-label">
							LIVE<div style="display:inline-block;color: red">AT</div><g:fieldValue bean="${eventInstance}" field="venue"/>
						</span>
					</g:if>
				</div>
			
				<!-- DATE TIME -->
				<div>
					<div class = "eventTime" id="eventTimeCorrect"></div>

					<g:if test="${eventInstance?.eventTime}">
						<span class="property-value" id = "eventTime" aria-labelledby="eventTime-label"  style = "opacity: 0;font-size: 0;">
							<g:fieldValue bean="${eventInstance}" field="eventTime"/>
						</span>		
					</g:if>
				</div>
			</div>

			<!-- LIVESTREAM WINDOW -->
			<div class="livestream-section">

			    <!-- stream window -->
			    <div id="videos-container"></div>
			    <!-- room url -->
			    <div id="room-urls" style="display: none;"></div>
			</div>

			<!-- TICKET STATUS -->
			<div class="ticketStatusDiv">
				<g:if test="${eventInstance?.ticketStatus}">
					<span class="property-value" id = "ticketStatus" aria-labelledby="ticketStatus-label">
						TICKETS <g:fieldValue bean="${eventInstance}" field="ticketStatus"/>
					</span>
				</g:if>
			</div>
		
			<!-- TICKET URL -->
			<div class="ticketLinkDiv">
				<a class = "ticketLink btn" id="ticket_url_append" target="_blank">BUY TICKETS</a>

				<g:if test="${eventInstance?.ticketUrl}">					
					<span class="property-value ticketUrl" aria-labelledby="ticketUrl-label" style="opacity: 0;font-size: 0;">
						<g:fieldValue bean="${eventInstance}" field="ticketUrl"/>
					</span>
				</g:if>				
			</div>

			<!-- RATING -->
			<rateable:ratings bean='${eventInstance}'/>

			<!-- COMMENTING -->
			<comments:render bean="${eventInstance}" />

			<!-- LATITUDE & LONGITUDE -->
			<div class="latitudeAndLongitude">
				<div>
					<g:if test="${eventInstance?.latitude}">
						<span class="property-value latitude" id = "latitude" aria-labelledby="latitude-label">
							<g:fieldValue bean="${eventInstance}" field="latitude"/>
						</span>
					</g:if>
				</div>

				<div>
					<g:if test="${eventInstance?.longitude}">
						<span class="property-value longitude" id = "longitude" aria-labelledby="longitude-label">
							<g:fieldValue bean="${eventInstance}" field="longitude"/>
						</span>
					</g:if>
				</div>
			</div>

			<div id="map"></div>	

		</div>

		<!-- LIVESTREAM BUTTON -->
		<div class="col-md-1">
			<sec:ifLoggedIn>
	    		<sec:ifAllGranted roles="ROLE_ADMIN">
					<div class="livestream-button">
					  	<g:form name = "Start" url="[resource:eventInstance, action:'update']" method="PUT" >
			  				<div name="livestream" type="text" id="room-id" value="${eventInstance?.livestream}"></div>
							
							<div>
			    				<g:actionSubmit id="open-room" class="save" action="update" value="LIVE" />
			    			</div>
		    			</g:form>

				    	<button style = "visibility: hidden;" id="join-room">Join</button>
				    	<button style = "visibility: hidden;" id="open-or-join-room">Auto Start or Join</button>
				    </div>
				</sec:ifAllGranted>
			</sec:ifLoggedIn>

		    <div class="attend-button">

		    </div>

		</div>

		<!-- SPOTIFY -->
		<div class="col-md-3">
		    <div class="container">
			    <div id="results"></div>
			</div>
			<script id="results-template" type="text/x-handlebars-template">
			    {{#each albums.items}}
			    <div style="background-image:url({{images.0.url}})" data-album-id="{{id}}" class="cover"></div>
			    {{/each}}
			</script>
		</div>

		<!--
		<g:form url="[resource:eventInstance, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${eventInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
		-->
	
	<!-- JAVASCRIPTS -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/2.0.0-alpha.1/handlebars.min.js"></script>
    <script src="${resource(dir:'js', file:'spotify.js')}" type="text/javascript"></script>
    <script src="${resource(dir:'js', file:'event.js')}" type="text/javascript"></script>

    <!-- GOOGLE MAPS API -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPPFxf8JyiTirmJeZvOWSW4z6NePOuEaU"></script>
  </body>
</html>
