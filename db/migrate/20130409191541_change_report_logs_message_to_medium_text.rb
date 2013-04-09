class ChangeReportLogsMessageToMediumText < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE report_logs CHANGE COLUMN message message mediumtext"
  end

  def self.down
    execute "ALTER TABLE report_logs CHANGE COLUMN message message text"
  end
end
