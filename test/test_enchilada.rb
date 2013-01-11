# require 'minitest/autorun'
# 
# def Oc2Rm(input)
#   @output
# end
# 
# class TestConverter < MiniTest::Unit::TestCase
#   def setup
#     @input = <<-OBJECTIVE_C
#     - (void)loadView {
#       [super loadView];
#       self.view.backgroundColor = [UIColor redColor];
#       UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
#       scroll.pagingEnabled = YES;
#       NSInteger numberOfViews = 3;
#       for (int i = 0; i < numberOfViews; i++) {
#         CGFloat xOrigin = i * self.view.frame.size.width;
#         UIView *awesomeView = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, 0, self.view.frame.size.width, self.view.frame.size.height)];
#         awesomeView.backgroundColor = [UIColor colorWithRed:0.5/i green:0.5 blue:0.5 alpha:1];
#         [scroll addSubview:awesomeView];
#         [awesomeView release];
#       }
#       scroll.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.view.frame.size.height);
#       [self.view addSubview:scroll];
#       [scroll release];
#     }
#     OBJECTIVE_C
# 
#     @output = <<-RUBYMOTION
#     def loadView
#       super
#       self.view.backgroundColor = UIColor.redColor
#       scroll = UIScrollView.alloc.initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
#       scroll.pagingEnabled = true
#       numberOfViews = 3
#       0.upto(numberOfViews) do |i|
#         xOrigin = i * self.view.frame.size.width
#         awesomeView = UIView.alloc.initWithFrame:CGRectMake(xOrigin, 0, self.view.frame.size.width, self.view.frame.size.height)
#         awesomeView.backgroundColor = UIColor.colorWithRed(0.5/i, green:0.5, blue:0.5, alpha:1)
#         scroll.addSubview(awesomeView)
#       end
#       scroll.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.view.frame.size.height);
#       self.view.addSubview(scroll)
#     end
#     RUBYMOTION
#         
#   end
# 
#   def test_converts_objective_c_to_rubymotion
#     Oc2Rm(@input).should_equal @output
#   end
# end
