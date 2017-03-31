function []= grab_new_spectra(position)

%position = round(pos);
%getappdata(0,'subplot_handle')
var_handles=getappdata(0,'var_handles');
%subplot_handle(2,1,2)
position = round(position);
set(var_handles.h2,'YData', squeeze(mean(mean(var_handles.aa(position(2):position(2)+position(4),position(1):position(1)+position(3), :)))))
  refresh()
  fprintf('Position X: %d, %d, Y: %d, %d\n',position(1),position(1)+position(3), position(2),position(2)+position(4))
  %plot(squeeze(mean(mean(aa(position(1):position(1)+position(3), position(2):position(2)+position(4),:)))));
end