module ApplicationHelper
  # 和暦表示
  def datedisplay(time)
    time.strftime(' ( %Je%Jg年 ) %Js%Jl月%Jd日')
  end

  # 選択中のリンクを識別
  def sidebar_link_item(name, path)
    class_name = 'channel'
    class_name << ' active' if current_page?(path)

    tag.p class: class_name do
      link_to name, path, class: 'channel_name'
    end
  end

  # アーカイブ
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
