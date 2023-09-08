const pay = () => {
  const publickey = gon.publickey
  const payjp = Payjp(publickey)
  const elements = payjp.elements();
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const information = document.getElementById("charge-form");
    const data = new FormData(information);

    const card = {
      card_number: data.get("order_location[card_number]"),
      card_month: data.get("order_location[card_month]"),
      card_year: data.get("order_location[card_year]"),
      card_cvc: data.get("order_location[card_cvc]")
    };

    payjp.createToken(card).then(function(response) {
      if (response.error){
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById('number-form').value = '';
      document.getElementById('expiry_month_form').value = '';
      document.getElementById('expiry_year_form').value = '';
      document.getElementById('cvc_form').value = '';
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);