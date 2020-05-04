require 'rails_helper'

RSpec.describe "動的プルダウンの確認", type: :system do
    before do
        FactoryBot.create(:prefecture1)
        FactoryBot.create(:prefecture2)
        FactoryBot.create(:city1)
        FactoryBot.create(:city2)
        FactoryBot.create(:city3)
        FactoryBot.create(:city4)
    end
    context "初期画面表示のとき" do
        before do
            # 初期画面を開く
            visit root_path
        end
        it "プルダウンの初期値を確認する" do
            expect(page).to have_select 'prefecture_id', options: ['東京','神奈川']
            expect(page).to have_select 'ward_id', options: ['渋谷区','文京区']
        end
        it "親プルダウンを変更すると子プルダウンの項目が変わることを検証する" do
            select '東京', from: 'prefecture_id'
            expect(page).to have_select 'ward_id', options: ['渋谷区', '文京区']
            select '神奈川', from: 'prefecture_id'
            expect(page).to have_select 'ward_id', options: ['川崎市 中原区', '横浜市 西区']
        end
    end
end