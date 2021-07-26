describe AttrJson::Associations::Association::HasOne do
  context 'without options' do
    let(:assoc) { described_class.new(Group, [:user]) }

    it 'resolves a class_name' do
      expect(assoc.class_name).to eq('User')
    end

    it 'resolves a primary_key' do
      expect(assoc.primary_key).to eq('id')
    end

    it 'resolves a foreign_key' do
      expect(assoc.foreign_key).to eq('group_id')
    end
  end

  context 'with scope' do
    let(:assoc) { described_class.new(Group, [:user, -> { order(:id)}]) }

    it 'has a scope' do
      expect(assoc.scoped.to_sql).to include('ORDER')
    end
  end
end
