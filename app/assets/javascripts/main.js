// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {

  $("#btn-run").click(function(){
    let ids = [];
    $(".airplane-select:checked").each(function() {
      let self = $(this);
      let id = $(this).data("airplane-id");
      let parent = self.closest("tr");
      self.prop("checked", false);
      let state = $(this).data("state");
      if (state != 'parked') {
        return true;
      }
      fetch("/airplanes/" + id + "/launch")
      .then((data) => data.text())
      .then((html) => {
        parent.html(html);
      });
      ids.push(id);
    });
    console.log(ids);
  });
});
