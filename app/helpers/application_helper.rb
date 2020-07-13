module ApplicationHelper
  # 和暦表示
  require 'date'
  def wareki(date = Time.zone.today)
    wareki, mon, day = date.jisx0301.split('.')
    gengou, year = wareki.partition(/\d+/).take(2)
    gengou.sub!(/[MTSH]/,
                'M' => '明治',
                'T' => '大正',
                'S' => '昭和',
                'H' => '平成')
    format(' ( %s%d年 ) %d月 %d日', gengou, year.to_i, mon.to_i, day.to_i)
  end

  # 選択中のリンクを識別
  def sidebar_link_item(name, path)
    class_name = 'channel'
    class_name << ' active' if current_page?(path)

    tag.p class: class_name do
      link_to name, path, class: 'channel_name'
    end
  end

  def ymconv(yyyymm, cnt)
    yyyy = yyyymm[0, 4]
    mm = yyyymm[4, 2]
    sprintf(yyyy + '年 ' + mm + '月(' + cnt + ')')
  end

  def ymconvn(yyyymm)
    yyyy = yyyymm[0, 4]
    mm = yyyymm[4, 2]
    sprintf(yyyy + '年' + mm + '月 ')
  end
end
