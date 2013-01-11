$LOAD_PATH << File.join(File.dirname(File.expand_path(__FILE__)), '..', 'lib')
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'
require 'oc2rm'

class TestOc2Rm < MiniTest::Unit::TestCase
  def setup
    @input = <<-OBJECTIVE_C
    - (void)loadView {
      [super loadView];
      self.view.backgroundColor = [UIColor redColor];
      UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
      scroll.pagingEnabled = YES;
      NSInteger numberOfViews = 3;
      for (int i = 0; i < numberOfViews; i++) {
        CGFloat xOrigin = i * self.view.frame.size.width;
        UIView *awesomeView = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, 0, self.view.frame.size.width, self.view.frame.size.height)];
        awesomeView.backgroundColor = [UIColor colorWithRed:0.5/i green:0.5 blue:0.5 alpha:1];
        [scroll addSubview:awesomeView];
        [awesomeView release];
      }
      scroll.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.view.frame.size.height);
      [self.view addSubview:scroll];
      [scroll release];
    }
    OBJECTIVE_C
  end

  def test_zero_arity_method_calls
    Oc2Rm('[UIView alloc]').must_equal 'UIView.alloc'
    Oc2Rm(@input).must_include 'UIColor.redColor'
  end

  def test_yes_to_true
    Oc2Rm('YES').must_equal 'true'
  end

  def test_remove_semicolons
    Oc2Rm(';').must_equal ''
  end

  def test_remove_method_calls_on_super
    Oc2Rm('super.loadView').must_equal 'super'
  end

  def test_remove_local_variable_type_definitions
    Oc2Rm('UIScrollView *scroll = ...').must_equal 'scroll = ...'
  end

  def test_remove_derefence_operators
    Oc2Rm('*scroll').must_equal 'scroll'
  end

  def test_remove_release_calls
    Oc2Rm('[scroll release]').must_equal ''
  end
end
