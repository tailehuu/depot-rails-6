import consumer from "./consumer"

consumer.subscriptions.create("ProductsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('connected to product channel')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('disconnected with product channel')
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('received data from product channel')
    const storeElement = document.querySelector('main.store')
    if (storeElement) {
      storeElement.innerHTML = data.html
    }
  }
});
