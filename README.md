CXGradientView
==============

Ultra-basic UIView/CAGradientLayer class. Animates using CATransaction.


    CXGradientView *gradientView = [[CXGradientView alloc] initWithFrame:self.view.bounds];

    gradientView.colors = @[[UIColor redColor], [UIColor whiteColor], [UIColor blueColor]];

    [self.view addSubview:gradientView];