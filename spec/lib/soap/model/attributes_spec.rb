require 'spec_helper'

describe Mscrm::Soap::Model::Attributes do

  describe 'initialization' do
    let(:attrs) {
      {
        "telephone1" => "123-213-1234",
        "modifiedon" => Time.now,
        "donotemail" => true,
        "id" => "1bfa3886-df7e-468c-8435-b5adfb0441ed",
        "reference" => {"Id" => "someid", "Name" => "entityname", "LogicalName" => "opportunity"}
      }
    }
    subject {
      Mscrm::Soap::Model::Attributes.new(attrs)
    }

    context "attributes extends hash" do
      it { subject.should == attrs }
    end

    context "parse attributes according to their type" do
      it { subject.to_xml.should include("<b:key>telephone1</b:key>") }
      it { subject.to_xml.should include("<b:key>donotemail</b:key>") }
      it { subject.to_xml.should include("<b:key>modifiedon</b:key>") }
    end

  end

end