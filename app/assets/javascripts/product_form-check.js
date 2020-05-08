$(function(){
  // 各フォームの入力チェック
  $(function(){
    //画像
    $('#image-input').on('focus',function(){
      $('#error-image').text('');
      $('#image-input').on('blur',function(){
        $('#error-image').text('');
        let imageLength = $('#output-box').children('li').length;
        if(imageLength ==''){
          $('#error-image').text('画像がありません');
        }else{
          $('#error-image').text('');
        }
      });
    });

    //送信しようとした時
    $('form').on('submit',function(){
      let imageLength = $('#output-box').children('li').length;
      if(imageLength ==''){
        $('body, html').animate({ scrollTop: 0 }, 500);
        $('#error-image').text('画像がありません');
      }else if(imageLength >10){
        $('body, html').animate({ scrollTop: 0 }, 500);
        $('#error-image').text('画像を10枚以下にして下さい');
      }else{
        return true;
      }
    });

    //商品名
    $('#name-select').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-name').text('入力してください');
        $(this).css('border-color','red');
      }else{
        $('#error-name').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //商品説明
    $('.sell-form__description').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-text').text('入力してください');
        $(this).css('border-color','red');
      }else{
        $('#error-text').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //状態
    $('#condition-select').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-condition').text('選択して下さい');
        $(this).css('border-color','red');
      }else{
        $('#error-condition').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //配送料の負担
    $('#postage-select').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-deliverycost').text('選択して下さい');
        $(this).css('border-color','red');
      }else{
        $('#error-deliverycost').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //配達の方法
    $('#delivery-company').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-delivery').text('選択して下さい');
        $(this).css('border-color','red');
      }else{
        $('#error-delivery').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });
    
    //発送元の地域
    $('#address-select').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-address').text('選択して下さい');
        $(this).css('border-color','red');
      }else{
        $('#error-address').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //発送までの日数
    $('#delivery_days-select').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-delivery_days').text('選択して下さい');
        $(this).css('border-color','red');
      }else{
        $('#error-delivery_days').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //価格
    $('.sell-form__box__input__label__number').on('blur',function(){
      let value = $(this).val();
      if(value < 300 || value > 999999){
        $('#error-price').text('300以上999999以下で入力してください');
        $(this).css('border-color','red');
      }else{
        $('#error-price').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });
  });
});