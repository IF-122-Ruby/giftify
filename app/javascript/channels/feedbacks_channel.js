import consumer from "./consumer"

consumer.subscriptions.create("FeedbacksChannel", {
  connected() {
    console.log("Connected to feedbacks channel");
  },

  disconnected() {

  },

  received(data) {
    toastr.info(data.message);

    let feedbacks = document.getElementById('feedbacks-icon');
    feedbacks.classList.remove("fa-chevron-right");
    feedbacks.classList.add("fa-circle");
    feedbacks.classList.add("text-primary");
  }
});
