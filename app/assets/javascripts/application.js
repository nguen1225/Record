// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
//= require moment
//= require fullcalendar
//= require chartkick
//= require Chart.bundle


$(document).on('turbolinks:load', function () {
  if($('.slider').hasClass('slick-initialized')){
  // カレンダーページから他のページに飛び、ブラウザバックを行ったとき、slickが二回呼び起こされ、再度読み込まれないバグが発生しました。
  // slick-initializedに原因があるらしく対処しましたが、どの方法も受け付けなかったので、ブラウザバックでslick-initializedが呼び出された時は強制的にリロードするようにしました。
    window.location.reload();
  }
  $('.slider').slick({
    autoplay: true,
    autoplaySpeed: 10000
  });

  // lengthを呼び出すことで、#calendarが存在していた場合はtrueの処理がされ、無い場合はnillを返す
  if ($('#calendar').length) {
    function eventCalendar() {
        return $('#calendar').fullCalendar({
        });
    };
    function clearCalendar() {
        $('#calendar').html('');
    };
    $(document).on('turbolinks:before-cache', clearCalendar);

    $('#calendar').fullCalendar({
        events: '/events.json',
        titleFormat: 'YYYY年 M月',
        dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
        header: {
            left: '',
            center: 'title',
            right: 'today prev,next'
        },
        defaultTimedEventDuration: '03:00:00',
        buttonText: {
            prev: '前',
            next: '次',
            prevYear: '前年',
            nextYear: '翌年',
            today: '今日',
            month: '月',
            week: '週',
            day: '日'
        },
        timeFormat: "HH:mm",
        eventColor: 'gray',
        eventTextColor: '#FFFFFF',
    });
  }
});
