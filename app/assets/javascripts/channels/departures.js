App.departures = App.cable.subscriptions.create("DeparturesChannel", {
  connected: function() {
    console.log("cable connected!");
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    console.log("cable disconnected!");
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    id = data['id']
    let row = $('#airplane-' + id);
    console.log(id);
    console.log(row);
    fetch("/airplanes/" + id)
    .then((data) => data.text())
    .then((html) => {
      row.html(html);
    });
  }
});
