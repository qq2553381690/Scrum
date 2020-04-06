package command;

import java.util.Date;

import entity.Point;

public class BinderCommand 
{
	// 坐标  entity.Point
    private Point point;
    
    // 生日
    private Date birthday;
    
    public BinderCommand() {
		super();
	}
    
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	

	public Point getPoint() {
		return point;
	}

	public void setPoint(Point point) {
		this.point = point;
	}
}
