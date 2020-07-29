RSpec.describe Stringy::Date do
    context 'A non-Date object is passed into the initializer' do
        subject { Stringy::Date.new('Wrong') }

        it 'should raise an ArgumentError' do
            expect { subject }.to raise_error(ArgumentError, "A Date must be passed into the initializer, but a String was passed in")
        end
    end

    describe 'time_since' do
        describe 'Returned string with proper time-scale language' do
            context 'precise is false' do
                subject { Stringy::Date.new(date).time_since }

                context 'less than a day from current date' do
                    let(:date) { Date.today }
                    it { is_expected.to eq('0 days') }
                end

                context 'one day from current date' do
                    let(:date) { Date.today - 1 }
                    it { is_expected.to eq('1 day') }
                end

                context 'between two days and one week from current date' do
                    let(:date) { Date.today - 2 }
                    it { is_expected.to eq('2 days') }
                end

                context 'a week from current date' do
                    let(:date) { Date.today - 7 }
                    it { is_expected.to eq('1 week') }
                end

                context 'between two weeks and a month from current date' do
                    let(:date) { Date.today - (7 * 2) }
                    it { is_expected.to eq('2 weeks') }
                end

                context 'a month from current date' do
                    let(:date) { Date.today << 1 }
                    it { is_expected.to eq('1 month') }
                end

                context 'between two months and a year from current date' do
                    let(:date) { Date.today << 2 }
                    it { is_expected.to eq('2 months') }
                end

                context 'one year from current_date' do
                    let(:date) { Date.today.prev_year }
                    it { is_expected.to eq('1 year') }
                end

                context 'more than one year from current_date' do
                    let(:date) { Date.today.prev_year(2) }
                    it { is_expected.to eq('2 years') }
                end
            end
        end
    end
end
