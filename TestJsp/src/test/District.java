package test;


public class District{
public static enum DistrictType
{
	/** 黄浦 */
	HUANGPU(310101),
	/** 卢湾 */
	LUWAN(310103),
	/** 徐汇 */
	XUHUI(310104),
	/** 长宁 */
	CHANGNING(310105),
	/** 静安 */
	JINGAN(310106),
	/** 普陀 */
	PUTUO(310107),
	/** 闸北 */
	ZHABEI(310108),
	/** 虹口 */
	HONGKOU(310109),
	/** 杨浦 */
	YANGPU(310110),
	/** 闵行 */
	MINHANG(310112),
	/** 宝山 */
	BAOSHAN(310113),
	/** 嘉定 */
	JIADING(310114),
	/** 浦东 */
	PUDONG(310115),
	/** 金山 */
	JINSHAN(310116),
	/** 松江 */
	SONGJIANG(310117),
	/** 青浦 */
	QINGPU(310118),
	/** 南汇 */
	NANHUI(310119),
	/** 奉贤 */
	FENGXIAN(310120),
	/** 崇明 */
	CHONGMING(310230);

	private int value;

	DistrictType(int value)
	{
		this.value = value;
	}

	public int getValue()
	{
		return value;
	}

	/**
	 * 获取类型
	 * 
	 * @param type
	 *        类型
	 * @return 类型
	 */
	public static DistrictType getType(int type)
	{
		// 遍历类型的枚举值
		for (DistrictType cou : DistrictType.values())
		{
			// 如果入参与枚举值相等
			if (cou.value == type)
			{
				return cou;
			}
		}
		return null;
	}

	/**
	 * 名称
	 * 
	 * @return
	 */
	public String getName()
	{
		String result = null;
		switch (this.value)
		{
			case 310101 :
			{
				result = "黄浦区";
				break;
			}
			case 310103 :
			{
				result = "卢湾区";
				break;
			}
			case 310104 :
			{
				result = "徐汇区";
				break;
			}
			case 310105 :
			{
				result = "长宁区";
				break;
			}
			case 310106 :
			{
				result = "静安区";
				break;
			}
			case 310107 :
			{
				result = "普陀区";
				break;
			}
			case 310108 :
			{
				result = "闸北区";
				break;
			}
			case 310109 :
			{
				result = "虹口区";
				break;
			}
			case 310110 :
			{
				result = "杨浦区";
				break;
			}
			case 310112 :
			{
				result = "闵行区";
				break;
			}
			case 310113 :
			{
				result = "宝山区";
				break;
			}
			case 310114 :
			{
				result = "嘉定区";
				break;
			}
			case 310115 :
			{
				result = "浦东新区";
				break;
			}
			case 310116 :
			{
				result = "金山区";
				break;
			}
			case 310117 :
			{
				result = "松江区";
				break;
			}
			case 310118 :
			{
				result = "青浦区";
				break;
			}
			case 310119 :
			{
				result = "南汇区";
				break;
			}
			case 310120 :
			{
				result = "奉贤区";
				break;
			}
			case 310230 :
			{
				result = "崇明县";
				break;
			}
			default :
			{
				
				break;
			}
		}
		return result;
	}
}
}
