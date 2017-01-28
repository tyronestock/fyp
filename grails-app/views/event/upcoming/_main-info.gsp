<div ng-if="!details || details == null">
  Loading results...
</div>

<div ng-if="details != 'empty' && details[0] != undefined">

  <img ng-src="{{ details[0].artists[0].thumb_url }}" class="artist-poster">
    <span ng-if="details[0].title">
      <strong class="venue_name">{{ details[0].venue.name }}</strong><br>
    </span>
    <span ng-if="details[0].formatted_datetime">
      <strong class="smaller">&nbsp;&nbsp;{{ details[0].formatted_datetime }}</strong> 
    </span>
    <span ng-if="details[0].formatted_location">
     |<strong class="smaller">&nbsp;{{ details[0].formatted_location }}</strong> 
    </span>
    <div class="button-row-1">
      <span ng-if="details[0].artists[0].facebook_page_url">
        <a href="{{ details[0].artists[0].facebook_page_url }}" target="_blank" class="pure-button facebook-background"><i class="fa fa-facebook"></i></a>
      </span>
      <span ng-if="details[0].artists[0].url">
        <a href="https://www.twitter.com/{{ details[0].artists[0].url }}" target="_blank" class="pure-button twitter-background"><i class="fa fa-twitter"></i></a>
      </span>
      <span ng-if="details[0].artists[0].website">  
        <a href="{{ details[0].artists[0].website }}" title="Website for {{ details[0].artists[0].name }}" target="_blank" class="pure-button website-background"><i class="fa fa-external-link"></i></a>
      </span>
    </div>
    <div>
      <span ng-if="details[0].ticket_url">
        <a href="{{ details[0].ticket_url }}" title="Tickets for {{ details[0].title }}" target="_blank" class="pure-button ticket-background">Tickets <i class="fa fa-ticket"></i></a>
      </span>
      <span ng-if="details[0].facebook_rsvp_url">
        <a href="{{ details[0].facebook_rsvp_url }}" title="RSVP for {{ details[0].title}}" target="_blank" class="pure-button calendar-background">RSVP <i class="fa fa-calendar-o"></i></a>
      </span>
      <span ng-if="details[0].artists[0].tracker_count">
        <strong class="bands_in_town_count">BandsInTown Fan Count: {{ details[0].artists[0].tracker_count }}</strong>
      </span>
    </div>   
</div>

<div ng-if="details">
  <div ng-if="(details.errors.length > 0 || details[0] == undefined) && search.length > 0">
    No results found for {{ search }} :/
  </div>
</div>