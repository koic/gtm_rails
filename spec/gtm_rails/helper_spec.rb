# frozen-string-literal: true

describe GtmRails::Helper, type: :helper do
  before do
    allow(Rails).to receive(:root) { Pathname('spec') }

    GtmRails::Hooks.init
  end

  let(:container_id) { 'GTM-XXXX' }

  describe '#google_tag_manager_script_tag' do
    subject { helper.google_tag_manager_script_tag(gtm_key) }

    context 'container id is set' do
      let(:gtm_key) { :foo }

      it { is_expected.to eq <<-EOS.strip_heredoc }
        <!-- Google Tag Manager -->
        <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','#{container_id}');</script>
        <!-- End Google Tag Manager -->
      EOS
    end

    context 'container id is not set' do
      let(:gtm_key) { :baz }

      it { is_expected.to eq '' }
    end
  end

  describe '#google_tag_manager_noscript_tag' do
    subject { helper.google_tag_manager_noscript_tag(gtm_key) }

    context 'container id is set' do
      let(:gtm_key) { :foo }

      it { is_expected.to eq <<-EOS.strip_heredoc }
        <!-- Google Tag Manager (noscript) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=#{container_id}"
        height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->
      EOS
    end

    context 'container id is not set' do
      let(:gtm_key) { :baz }

      it { is_expected.to eq '' }
    end
  end
end
