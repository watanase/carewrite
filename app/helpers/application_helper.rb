module ApplicationHelper
  require 'date'
  def wareki(date = Date.today)
    _wareki, mon, day = date.jisx0301.split(".")
    gengou, year = _wareki.partition(/\d+/).take(2)
    gengou.sub!(/[MTSH]/,
                'M' => '明治',
                'T' => '大正',
                'S' => '昭和',
                'H' => '平成')
    sprintf(" ( %s%d年 ) %d月 %d日", gengou, year.to_i, mon.to_i, day.to_i)
  end

  def sidebar_link_item(name, path)
    class_name = 'channel'
    class_name << ' active' if current_page?(path)

    content_tag :p, class:class_name do
      link_to name, path, class: 'channel_name'
    end
  end
end
