<%@ page pageEncoding="UTF-8"%>

<html>
<head>
<title>scatter</title>

<!-- ECharts单文件引入 -->

<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/echarts/echarts.min.js"></script>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 100%; height: 100%"></div>
	<script type="text/javascript">
	
	var femaleDataAll=[[41, 705.67], [39, 652.51], [52, 653.47], [40, 675.21], [28, 627.67], [38, 662.71], [31, 725.15], [33, 647.69], [29, 626.61], [38, 742.03], [42, 759.46], [74, 579.41], [47, 738.57], [45, 662.71], [22, 589.34], [52, 656.87], [30, 617.27], [25, 620.79], [49, 703.12], [26, 600.9], [38, 826.36], [42, 745.86], [38, 715.26], [48, 714.17], [48, 651.11], [54, 729.53], [32, 682.41], [34, 754.02], [27, 617.74], [34, 750.12], [34, 611.66], [52, 665.22], [36, 758.53], [38, 691.46], [39, 662.71], [29, 609.91], [53, 655.13], [34, 737.19], [52, 709.42], [35, 732.08], [32, 735.9], [48, 648.02], [59, 627.09], [31, 653.71], [30, 652.95], [30, 676.75], [50, 646.1], [43, 673.22], [35, 680.64], [35, 714.77], [21, 583.12], [40, 698.08], [24, 599.28], [33, 635.94], [55, 627.24], [43, 596.87], [39, 718.66], [29, 636.81], [38, 662.71], [29, 707.11], [30, 654.05], [31, 609.51], [34, 737.6], [36, 723.16], [45, 730.13], [40, 737.78], [52, 723.02], [33, 736.36], [37, 726.73], [35, 662.71], [31, 634.24], [25, 617.39], [43, 799.16], [30, 682.45], [39, 706.91], [24, 601.44], [42, 727.16], [24, 615.04], [25, 650.71], [21, 593.32], [22, 589.34], [27, 632.58], [54, 763.53], [39, 638.91], [35, 759.9], [22, 589.34], [41, 661.61], [39, 675.21], [76, 579.41], [38, 647.87], [51, 634.6], [37, 771.96], [42, 638.91], [33, 682.66], [38, 657.59], [78, 579.41], [48, 732.44], [45, 694.86], [36, 741.97], [27, 657.4], [57, 622.39], [38, 599.66], [31, 732.37], [32, 672.03], [36, 671.85], [39, 695.01], [29, 629.97], [41, 628.71], [40, 762.86], [31, 641.35], [37, 728.86], [32, 649.33], [40, 752.66], [28, 580.38], [29, 673.11], [40, 700.11], [67, 590.31], [58, 644.45], [37, 672.91], [39, 615.11], [37, 672.91], [66, 593.89], [33, 746.74], [34, 614.75], [35, 742.46], [26, 634.28], [40, 728.68], [35, 659.31], [34, 652.15], [56, 631.09], [26, 612.65], [35, 702.89], [34, 695.62], [72, 614.34], [38, 705.06], [36, 751.56], [30, 713.81], [53, 629.47], [31, 633.31], [40, 752.66], [45, 732.43], [36, 661.61], [52, 753.62], [33, 711.85], [23, 595.47], [32, 635.73], [88, 604.14], [22, 602.94], [25, 607.19], [32, 662.62], [33, 672.15], [53, 663.47], [54, 629.38], [34, 728.5], [31, 594.06], [39, 728.86], [52, 653.47], [29, 684.41], [62, 607.62], [25, 620.79], [40, 760.48], [32, 725.2], [33, 649.99], [31, 646.91], [42, 742.46], [33, 671.49], [35, 662.71], [27, 695.9], [40, 658.85], [51, 644.8], [33, 647.69], [35, 750.53], [52, 633.07], [43, 744.16], [26, 650.49], [34, 738.7], [47, 728.37], [47, 704.57], [31, 633.31], [33, 705.06], [48, 671.82], [39, 651.89], [32, 731.96], [31, 754.96], [36, 630.87], [34, 682.14], [36, 638.91], [32, 737.29], [25, 607.19], [75, 604.14], [72, 614.34], [57, 622.39], [34, 638.86], [40, 752.66], [20, 576.87], [27, 702.4], [45, 722.67], [31, 670.09], [81, 604.14], [42, 672.91], [47, 638.42], [21, 583.12], [37, 652.51], [40, 775.36], [36, 739.67], [24, 579.8], [33, 647.69], [20, 576.87], [29, 660.3], [37, 638.91], [41, 686.47], [36, 766.43], [32, 727.57], [38, 638.91], [36, 751.56], [25, 607.19], [40, 765.16], [33, 615.54], [36, 743.25], [67, 590.31], [39, 661.61], [31, 665.11], [34, 676.84], [20, 624.47], [34, 748.9], [33, 725.06], [33, 671.49], [52, 633.07], [60, 624.12], [37, 631.49], [40, 709.21], [38, 649.73], [34, 742.27], [41, 652.2], [47, 662.22], [49, 636.98], [36, 656.53], [36, 771.96], [56, 657.05], [27, 666.58], [18, 564.53], [32, 683.33], [50, 658], [49, 723.52], [38, 737.96], [40, 694.86], [57, 669.99], [43, 725.46], [48, 632.57], [37, 662.71], [32, 669.73], [29, 613.04], [33, 702.71], [22, 589.34], [44, 715.26], [34, 659.75], [65, 597.43], [25, 611.52], [45, 761.16], [36, 739.85], [29, 626.61], [33, 649.99], [33, 741.21], [39, 718.66], [35, 754.96], [35, 747.98], [71, 604.14], [29, 672.39], [33, 725.58], [53, 721.27], [50, 725.85], [62, 641.62], [36, 705.31], [36, 714.16], [33, 719.54], [31, 633.31], [35, 735.79], [61, 654.25], [21, 583.12], [37, 743.38], [31, 653.4], [36, 754.96], [71, 588.34], [38, 766.43], [33, 660.07], [26, 657.12], [36, 676.31], [33, 739.36], [28, 660.09], [67, 624.31], [83, 604.14], [34, 678.29], [70, 614.34], [33, 718.03], [35, 638.91], [33, 651.09], [33, 705.49], [33, 665.1], [38, 713.09], [35, 665.01], [39, 722.67], [35, 696.71], [27, 650.64], [32, 736.9], [32, 675.43], [45, 749.26], [41, 672.91], [37, 780.46], [44, 693.62], [44, 671.4], [36, 775.36], [40, 652.51], [33, 671.49], [34, 741.93], [38, 706.43], [42, 737.36], [47, 670.57], [39, 684.66], [34, 716.43], [57, 622.39], [25, 661.74], [45, 652.51], [36, 786.17], [56, 624.9], [39, 705.06], [22, 602.94], [24, 614.07], [41, 638.91], [30, 630.25], [36, 615.11], [29, 626.61], [42, 771.36], [25, 605.03], [59, 616.89], [50, 648.4], [32, 611.93], [35, 742.46], [32, 649.95], [36, 654.06], [31, 633.31], [35, 802.56], [38, 741.36], [40, 742.63], [52, 633.07], [31, 654.44], [36, 705.06], [50, 680.1], [25, 607.19], [29, 653.36], [34, 711.07], [65, 597.43], [24, 601.9], [42, 702.41], [34, 638.55], [57, 632.59], [22, 589.34], [35, 725.46], [33, 648.62], [33, 637.49], [35, 692.07], [70, 604.14], [33, 763.95], [35, 562.87], [44, 775.36], [38, 657.46], [46, 619.32], [34, 695.7], [45, 715.26], [39, 667.39], [53, 641.53], [30, 606.45], [38, 652.51], [38, 642.93], [38, 732.43], [37, 696.71], [26, 607.39], [56, 747.15], [21, 603.52], [57, 647.12], [30, 630.25], [61, 610.83], [24, 593.4], [55, 627.24], [38, 685.89], [31, 646.91], [48, 637.82], [34, 671.28], [37, 671.81], [36, 752.23], [35, 671.71], [23, 619.27], [34, 719.71], [44, 699.18], [63, 649.43], [39, 705.06], [53, 663.47], [33, 743.35], [36, 662.71], [29, 638.97], [27, 606], [31, 720.47], [34, 760.2], [40, 672.91], [38, 767.18], [48, 574.46], [42, 638.91], [42, 752.66], [35, 744.95], [40, 762.86], [35, 668.27], [40, 672.91], [62, 628.02], [33, 671.49], [31, 656.49], [53, 665.33], [34, 651.05], [36, 671.67], [28, 622.42], [53, 631.33], [38, 727.16], [63, 664.31], [52, 633.07], [30, 690.35], [36, 761.76], [33, 721.52], [38, 691.59], [44, 742.46], [32, 649.33], [40, 726.48], [36, 638.91], [52, 643.27], [46, 655.79], [39, 638.91], [46, 751.43], [36, 675.21], [22, 589.34], [34, 742.89], [35, 646.17], [75, 614.34], [27, 604.76], [34, 628.35], [38, 702.89], [34, 700.02], [25, 609.04], [36, 627.16], [50, 635.9], [52, 633.07], [39, 670.4], [34, 696.35], [38, 693.31], [51, 634.6], [31, 651.89], [32, 696.28], [32, 732.9], [27, 619.6], [41, 652.2], [23, 595.47], [34, 638.55], [35, 771.36], [56, 644.07], [36, 783.87], [30, 648.49], [29, 700.96], [37, 663.02], [20, 576.87], [58, 619.72], [32, 732.46], [42, 688.98], [36, 668.27], [34, 657.14], [35, 759.46], [33, 637.49], [32, 702.15], [28, 723.82], [32, 656.13], [32, 718.22], [30, 620.05], [59, 641.62], [33, 637.49], [38, 775.36], [34, 738.7], [38, 741.97], [59, 641.62], [28, 622.42], [38, 672.91], [30, 584.51], [28, 598.93], [27, 638.1], [31, 659.41], [26, 577.1], [31, 666.87], [62, 652.74], [36, 616.81], [40, 718.66], [28, 665.23], [33, 676.74], [34, 674.85], [32, 724.91], [54, 663.38], [29, 581.17]];
	var maleDataAll=[[44, 728.86], [27, 641.85], [35, 640.59], [43, 617.89], [30, 654.05], [33, 649.99], [42, 754.96], [31, 695.4], [34, 672.55], [34, 672.55], [24, 593.4], [32, 754.85], [25, 641.19], [60, 687.22], [26, 612.65], [29, 694.3], [36, 740.08], [41, 765.16], [35, 696.09], [27, 615.58], [59, 623.25], [42, 773.06], [55, 752.95], [39, 652.51], [33, 658.2], [36, 741.99], [27, 624.85], [28, 656.11], [42, 735.48], [36, 675.21], [33, 753.7], [32, 643.15], [44, 731.16], [57, 627.24], [40, 675.21], [25, 641.19], [37, 632.73], [41, 761.16], [34, 743.37], [41, 718.66], [36, 707.88], [34, 761.73], [38, 739.66], [49, 725.81], [39, 771.36], [43, 662.71], [33, 633.32], [41, 651.41], [33, 684.78], [39, 634.27], [47, 660.67], [36, 742.46], [27, 631.34], [48, 661.95], [33, 661.29], [39, 739.06], [42, 631.8], [33, 738.91], [44, 754.96], [37, 680.64], [45, 649.11], [52, 655.23], [27, 654.49], [45, 681.26], [48, 762.1], [32, 657.02], [24, 602.37], [38, 658.07], [25, 620.79], [38, 686.51], [38, 765.16], [22, 609.74], [31, 583.42], [48, 695.95], [30, 643.85], [23, 643.07], [59, 737], [39, 674.76], [27, 639.07], [27, 617.74], [65, 608.7], [33, 634.71], [51, 753.05], [25, 620.79], [35, 807.66], [44, 719.41], [42, 638.91], [56, 717.71], [33, 736.36], [35, 638.91], [24, 628.95], [35, 719.27], [60, 675.32], [35, 685.41], [30, 576.47], [22, 589.34], [33, 671.49], [39, 672.91], [62, 616.41], [50, 759.06], [60, 644.88], [34, 621.86], [35, 742.46], [47, 638.57], [32, 711.19], [41, 638.91], [35, 732.08], [33, 681.01], [36, 615.11], [28, 648.52], [63, 613.92], [69, 622.16], [46, 704.97], [37, 754.96], [52, 768.98], [31, 628.94], [31, 658], [36, 675.69], [33, 627.29], [38, 754.96], [37, 759.46], [45, 739.06], [27, 614.65], [25, 607.19], [43, 638.91], [37, 675.21], [46, 686.43], [33, 683.99], [52, 668.83], [36, 643.24], [35, 733.53], [33, 729.46], [47, 695.27], [33, 637.49], [40, 788.96], [34, 741], [31, 601.16], [29, 665.36], [38, 672.91], [37, 638.91], [34, 714.74], [28, 656.42], [40, 722.82], [27, 602.29], [33, 614.62], [34, 735.13], [36, 763.03], [36, 706.91], [41, 652.51], [60, 654.73], [37, 762.86], [37, 652.51], [30, 654.05], [35, 652.51], [72, 588.51], [24, 583.2], [39, 736.76], [47, 696.37], [41, 696.71], [35, 686.2], [30, 660.54], [46, 752.57], [57, 695.24], [28, 620.25], [59, 670.85], [56, 705.38], [28, 636.02], [39, 638.91], [38, 640.76], [29, 684.1], [38, 685.41], [33, 697.59], [68, 600.33], [39, 736.08], [50, 682.52], [27, 606], [37, 777.67], [40, 675.21], [55, 610.92], [59, 748.47], [20, 576.87], [40, 638.91], [64, 621.55], [65, 657.23], [32, 709.01], [26, 612.65], [41, 652.51], [69, 607.63], [40, 662.71], [30, 684.03], [46, 653.19], [61, 632.39], [66, 605.97], [38, 652.51], [40, 731.16], [28, 690.42], [66, 605.97], [34, 808.57], [46, 638.83], [36, 639.22], [26, 636.45], [31, 633.31], [25, 619.69], [65, 622.3], [28, 626.74], [35, 699.8], [24, 601.44], [42, 649.11], [40, 672.91], [30, 708.86], [32, 723.38], [47, 728.52], [46, 638.83], [42, 754.96], [29, 627.53], [36, 684.35], [36, 754.53], [35, 740.89], [36, 740.95], [37, 743.38], [32, 777.3], [21, 596.72], [38, 688.81], [45, 773.06], [30, 650.03], [39, 734.38], [31, 711.61], [31, 673.76], [50, 623.21], [29, 711.8], [27, 617.74], [46, 652.43], [30, 630.25], [38, 752.66], [35, 696.71], [42, 699.01], [39, 718.66], [29, 669.22], [39, 752.66], [35, 809.36], [32, 635.73], [25, 685.47], [37, 661.01], [34, 717.41], [38, 665.01], [68, 600.33], [65, 683.77], [29, 650.41], [52, 714.58], [71, 616.24], [31, 645.81], [41, 672.91], [31, 609.51], [38, 652.51], [20, 576.87], [43, 773.66], [28, 610.67], [40, 754.96], [27, 617.74], [42, 672.91], [29, 640.21], [28, 654.37], [30, 630.25], [29, 626.61], [23, 613.09], [46, 652.43], [29, 637.42], [36, 713.89], [59, 657.25], [47, 660.67], [28, 664.57], [28, 635.08], [39, 638.91], [45, 752.82], [54, 656.03], [56, 695.18], [61, 686.79], [34, 637.94], [34, 652.15], [33, 726.95], [38, 765.16], [38, 726.06], [52, 656], [35, 763.46], [47, 662.37], [29, 608.37], [37, 784.96], [42, 737.36], [34, 694.64], [45, 663.02], [59, 757.4], [36, 743.25], [30, 711.2], [39, 668.89], [39, 778.75], [35, 735.48], [55, 630.7], [30, 630.25], [37, 652.51], [46, 652.43], [62, 630.01], [39, 686.51], [28, 685.59], [55, 654.5], [38, 739.66], [51, 724.57], [25, 617.97], [66, 605.97], [35, 751.56], [28, 639.69], [27, 593.94], [31, 633.31], [53, 655.7], [28, 659.62], [39, 733.96], [32, 678.08], [34, 733.17], [37, 753.43], [37, 756.48], [32, 772.37], [58, 739.05], [45, 675.21], [61, 686.79], [68, 634.33], [43, 754.96], [40, 656.84], [45, 652.51], [52, 648.43], [48, 675.55], [39, 775.36], [46, 638.83], [42, 753.27], [36, 750.28], [32, 682.14], [34, 704.7], [36, 706.91], [43, 652.51], [37, 783.26], [52, 758.78], [34, 599.93], [74, 582.45], [31, 657.07], [34, 637.32], [38, 771.96], [41, 759.46], [34, 685.05], [30, 661.63], [40, 627.78], [30, 664.25], [32, 611.93], [33, 708.23], [40, 700.11], [38, 773.66], [36, 706.6], [32, 663.11], [31, 633.31], [37, 761.76], [50, 636.81], [29, 640.21], [46, 743.65], [52, 724.78], [33, 696.66], [32, 729.5], [31, 724.45], [37, 696.71], [32, 696.93], [34, 612.9], [36, 616.04], [36, 660.34], [42, 778.16], [44, 686.51], [63, 627.52], [26, 663.03], [66, 605.97], [36, 693.91], [40, 728.86], [27, 641.54], [30, 630.25], [45, 622.22], [34, 713.7], [69, 655.23], [26, 607.39], [30, 625], [37, 822.96], [25, 608.25], [40, 765.16], [39, 746.03], [28, 635.71], [33, 717.2], [38, 696.75], [23, 584.03], [34, 760.37], [36, 760.56], [35, 652.51], [26, 612.65], [38, 685.41], [53, 689.7], [35, 672.91], [33, 717.51], [42, 671.98], [39, 638.91], [29, 614.86], [46, 667.27], [56, 663.04], [38, 784.28], [37, 640.78], [40, 738.71], [29, 683.96], [42, 762.86], [30, 703.16], [34, 710.3], [33, 637.49], [48, 738.3], [28, 647.45], [47, 775.02], [50, 670.81], [39, 775.36], [27, 631.34], [30, 691.63], [34, 638.55], [31, 646.91], [65, 566.66], [33, 686.35], [32, 670.04], [37, 745.68], [36, 721.71], [38, 794.06], [31, 660.2], [31, 645.81], [24, 615.04], [41, 638.91], [29, 707.76], [34, 679.53], [38, 758.78], [48, 735.92], [52, 743.48], [38, 739.06], [40, 662.71], [56, 761.48], [33, 664.56], [41, 809.36], [33, 752.65], [58, 683.1], [34, 778.9], [39, 753.93], [26, 630.57], [37, 781.98], [34, 706.9], [39, 611.78], [31, 711.39], [45, 696.71], [83, 579.41], [32, 729.87], [56, 695.18], [31, 715.88], [50, 657.52], [33, 647.07], [59, 647.05], [41, 781.56], [34, 652.15], [60, 621.08], [37, 754.96], [29, 638.04], [45, 648.18], [37, 775.36], [55, 734.25], [39, 639.22], [31, 646.91], [27, 647.26], [38, 715.39], [32, 672.03], [49, 736.01], [26, 638.75], [25, 617.39], [33, 671.49], [37, 715.84], [43, 625.62], [42, 732.43], [60, 621.08], [29, 671.85], [45, 727.16], [34, 686.15], [44, 703.47], [32, 666.33], [33, 664.54], [33, 742.31], [40, 708.28], [38, 682.69], [31, 667.62], [35, 715.87], [30, 667], [32, 625.53], [42, 662.71], [27, 641.2], [33, 658.91], [33, 671.49], [33, 758.64], [42, 764.73], [35, 756.23], [34, 638.55]];
	var statDataAll=[[38,575],[153,625],[145,675],[119,725],[43,775],[2,825]];
	var statData2=[[10,575],[50,625],[70,675],[60,725],[20,775],[1,825]];
	femaleData=femaleDataAll.slice(0,10);
	maleData=maleDataAll.slice(0,10);
	// statistics data
	statData=[[]];
	i=1;
	
	// flag for dynamtic display
	var dynamticData=false;
	//var dynamticData=true;
	
	function addData() {
		if (dynamticData){
		   if (i<51){
			    femaleData=femaleDataAll.slice(0,i*10);
				maleData=maleDataAll.slice(0,i*10);
		   }else{
			   statData=statDataAll;
			   clearInterval(timer);
		   }
		}else{
			femaleData=femaleDataAll;
			maleData=maleDataAll;
			 statData=statDataAll;
			clearInterval(timer);
		}
	}
	
		var myChart = echarts.init(document.getElementById('main'));
		//	for (i=500;i<500;i++){
		
			
		//schema for data formatter
		var schema = [ {
			name : '年龄',
			index : 0,
			text : '岁'
		}, {
			name : '分数',
			index : 1,
			text : '分'
		}, ];

		// option 放在循环内实现

		/*      	myChart.showLoading({
		     	    textStyle :
		     	    {
		     	        fontSize : 20,
		     	    	fontFamily: '微软雅黑',
		     	    }
		     	}); */

		/* option = {
			title : {
				text : "男性女性年龄分数分布"
			},
			animationThreshold : 10000,
			animationEasing : 'BackIn(2000)',
			animationDuration : 1000,
			tooltip : {
				trigger : "axis",
				showDelay : 0,
				axisPointer : {
					type : "cross",
					lineStyle : {
						type : "dashed",
						width : 1
					}
				},
				formatter : function (params) {
				     if (params.value.length > 1) {
				         return params.seriesName + ' :<br/>'
				            + params.value[0] + '岁 ' 
				            + params.value[1] + '分 ';
				     }
				     else {
				         return params.seriesName + ' :<br/>'
				            + params.name + ' : '
				            + params.value + '分 ';
				     }
				 },  
				formatter : function(obj) {
					var value = obj.value;
					return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
							+ obj.seriesName
							+ ' '
							+ '</div>'
							+ value[0]
							+ schema[0].text
							+ ','
							+ value[1]
							+ schema[1].text
							+ ' <br>'
				}
			},
			legend : {
				x : 'center',
				data : [ "女性", "男性" ],
				'selected' : {
					'女性' : true,
					'男性' : true,
				}
			},
			toolbox : {
				show : true,
				orient : 'vertical',
				x : 'right',
				y : 'center',
				feature : {
					mark : {
						show : true
					},
					dataZoom : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : true
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			xAxis : [ {
				type : "value",
				scale : true,
				name : "年龄",
				splitLine : {
					lineStyle : {
						type : 'dashed'
					}
				}
			}
			,
			 {
			     type : 'value',
			     scale : true,
			     splitNumber: 180,
			     axisLabel: {show:false},
			     splitLine: {show:false}
			 }
			],
			yAxis : [ {
				type : "value",
				precision : 2,
				scale : true,
				name : "分数",
				splitLine : {
					lineStyle : {
						type : 'dashed'
					}
				}
			} ],
			series : [ {
				name : "女性",
				type : "scatter",
				data : femaleData,
				symbol : 'circle',
				hoverAnimation : true,
				itemStyle : {
					normal : {
						opacity : 0.8
					}
				},
				markLine : {
					name : '女性平均值',
					symbol : 'emptyDiamond',
					data : [ {
						type : 'average'
					} ]
				},
				markPoint : {
					symbol : 'pin',
					symbolSize : 70,
					data : [ {
						type : 'max',
						name : '最大值'
					}, {
						type : 'min',
						name : '最小值'
					} ],
					itemStyle : {
						normal : {
							opacity : 0.8
						}
					},
					effect : {
						show : true,
						type : 'scale',
						loop : true,
						period : 20,
						scaleSize : 1,
						color : null,
					},
				}
			}, {
				name : "男性",
				type : "scatter",
				data : maleData,
				symbol : 'circle',
				markLine : {
					symbol : 'emptyDiamond',
					name : '男性平均值',
					data : [ {
						type : 'average'
					} ],
				}
				},
				itemStyle : {
					normal : {
						opacity : 0.8
					}
				},
				markPoint : {
					symbol : 'pin',
					symbolSize : 70,
					data : [ {
						type : 'max',
						name : '最大值'
					}, {
						type : 'min',
						name : '最小值'
					} ],
					itemStyle : {
						normal : {
							shadowColor : 'rgba(0, 0, 0, 0.5)',
							shadowBlur : 10,
							opacity : 0.8
						}
					},
					effect : {
						show : true,
						type : 'scale',
						loop : true,
						period : 20,
						scaleSize : 1,
						color : null,
					},
				}
			} ,
	       {
	       		name: "分数段分布",
	            type:'line',
	            smooth:true,
	            data:[[38,575],[153,625],[145,675],[119,725],[43,775],[2,825]],
	            xAxisIndex:1,
	        }

			]
		}; */

		var timer = setInterval(function() {
			i++;
			addData();
			myChart.setOption({
				title : {
					text : "男性女性年龄分数分布",
					 textStyle: {
				            color: '#ccc'          
				        }
				},
				animationThreshold : 10000,
				animationEasing : 'BackIn(2000)',
				animationDuration : 1000,
				backgroundColor: '#1b1b1b',

			    // é»˜è®¤è‰²æ¿
			    color: [
			        '#FE8463','#9BCA63','#FAD860','#60C0DD','#0084C6',
			        '#D7504B','#C6E579','#26C0C0','#F0805A','#F4E001',
			        '#B5C334'
			    ],
				tooltip : {
					trigger : "axis",
					showDelay : 0,
					axisPointer : {
						type : "cross",
						lineStyle : {
							type : "dashed",
							width : 1
						}
					},
					formatter : function(obj) {
						var value = obj.value;
						if (obj.name=='最大值'||obj.name=='最小值'){
							
							return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
									+ obj.seriesName+obj.name
									+ ' '
									+ '</div>'
									+value+"分"
									+ ' <br>'
						}else if (obj.name==""&&value.length!=2){
							return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
							+ obj.seriesName+"平均值 "
							+ ' '
							+ '</div>'
							+ value +"分"
							+ ' <br>'
						}else{
							return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
									+ obj.seriesName
									+ ' '
									+ '</div>'
									+ value[0]
									+ schema[0].text
									+ ','
									+ value[1]
									+ schema[1].text
									+ ' <br>'
						}
						
					}
				},
				legend : {
					x : 'center',
					data : [ "女性", "男性" ,"男性分数段分布","女性分数段分布"],
					'selected' : {
						'女性' : true,
						'男性' : true,
						"男性分数段分布":true,
						"女性分数段分布":true
					},
					 textStyle: {
				            color: '#ccc'          
				        }
				},
				toolbox : {
					show : true,
					orient : 'vertical',
					x : 'right',
					y : 'center',
					feature : {
						mark : {
							show : true
						},
						dataZoom : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : true
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				xAxis : [ {
					type : "value",
					scale : true,
					name : "年龄",
					splitLine : {
						lineStyle : {
							type : 'dashed'
						}
					},
					nameTextStyle: {
						color: '#fff',
					},
					axisLabel: {
						textStyle: {
							color: '#fff',
						},
					}
				}
				 ,
				 {
				     type : 'value',
				     scale : true,
				     splitNumber: 200,
				     axisLabel: {show:false},
				     splitLine: {show:false},
				     name:"人数",
					 nameTextStyle: {
						color: '#fff',
					},
				 } 
				],
				yAxis : [ {
					type : "value",
					precision : 2,
					scale : true,
					name : "分数",
					splitLine : {
						lineStyle : {
							type : 'dashed'
						}
					},
					nameTextStyle: {
						color: '#fff',
					},
					axisLabel: {
						textStyle: {
							color: '#fff',
						},
					}
				} ],
				//color:['#473792','#fcb539','#4fd0e7','#f8713b','#16d7b9','#c4a2e7'],
				series : [ {
					name : "女性",
					type : "scatter",
					data : femaleData,
					symbol : 'circle',
					symbolSize: 8,
					largeThreshold:250,
					hoverAnimation : true,
					itemStyle : {
						normal : {
							opacity : 0.5
						}
					},
					markLine : {
						name : '女性平均值',
						symbol : 'emptyDiamond',
						data : [ {
							type : 'average'
						} ]
					},
					markPoint : {
						symbol : 'pin',
						symbolSize : 70,
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ],
						itemStyle : {
							normal : {
								opacity : 0.8
							}
						},
						effect : {
							show : true,
							type : 'scale',
							loop : true,
							period : 20,
							scaleSize : 1,
							color : null,
						},
					}
				}, {
					name : "男性",
					type : "scatter",
					data : maleData,
					symbol : 'circle',
					symbolSize: 8,
					largeThreshold:250,
					markLine : {
						symbol : 'emptyDiamond',
						name : '男性平均值',
						data : [ {
							type : 'average'
						} ],
					},
					itemStyle : {
						normal : {
							opacity : 0.5
						}
					},
					markPoint : {
						symbol : 'pin',
						symbolSize : 70,
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ],
						itemStyle : {
							normal : {
								shadowColor : 'rgba(0, 0, 0, 0.5)',
								shadowBlur : 10,
								opacity : 0.8
							}
						},
						effect : {
							show : true,
							type : 'scale',
							loop : true,
							period : 20,
							scaleSize : 1,
							color : null,
						},
					}
				} ,
			       {
		       		name: "男性分数段分布",
		            type:'line',
		            smooth:true,
		            scale:true,
		            data:statData,
		            xAxisIndex:1,
		            symbol: 'none',
		        }, {
		       		name: "女性分数段分布",
		            type:'line',
		            smooth:true,
		            scale:true,
		            data:statData2,
		            xAxisIndex:1,
		            symbol: 'none',
		        }

				]
			});
		}, 500);
	</script>
</body>

</html>
