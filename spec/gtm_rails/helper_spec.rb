describe GtmRails::Helper, type: :helper do
  describe '#google_tag_manager' do
    before do
      allow(Rails).to receive(:root) { Pathname('spec') }

      GtmRails::Hooks.init
    end

    let(:gtm) { 'GTM-XXXX' }

    subject { helper.google_tag_manager(:foo) }

    it { is_expected.to eq <<-EOS.strip_heredoc }
<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=#{gtm}"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','#{gtm}');</script>
<!-- End Google Tag Manager -->
    EOS
  end
end
