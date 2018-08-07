# Blocmetrics
## An analytics service and reporting tool that you can be used to track user activity and report results

### Features:
 - A client-side JavaScript snippet that allows a user to track events on their website.
 - A server-side API that captures and saves those events to a database.
 - A Rails application that displays the captured event data for a user in a chart and line graph form.

### Getting Started:

The client will add this script to their website/application

```javascript
var blocmetrics = {
  report: function(event_name) {
    var _bm_event = {
      name: event_name
    };

    var _bm_request = new XMLHttpRequest();
    _bm_request.open("POST", "https://davidsblocmetrics.herokuapp.com/api/events", true);
    _bm_request.setRequestHeader('Content-Type', 'application/json');

    _bm_request.onreadystatechange = function() {
    };
    _bm_request.send(JSON.stringify(_bm_event));
  }
};
```

OR

```var blocmetrics = {};
  blocmetrics.report = function(eventName){
    var event = {event: { event_name: eventName }};

    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };```


For a user to track an event, all they have to do is add the snippet `blocmetrics.report('name_of_event')` wherever desired.

for example:

```javascript
window.onload = function() {
  blocmetrics.report('name_of_event');
};
```
