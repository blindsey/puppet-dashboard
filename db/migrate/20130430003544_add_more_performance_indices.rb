class AddMorePerformanceIndices < ActiveRecord::Migration
  def self.up
    add_index :node_group_edges, :from_id
    add_index :node_group_edges, :to_id
    add_index :parameters, [:parameterable_id, :parameterable_type, :key], :name => 'index_parameters_multi'
    add_index :node_group_class_memberships, :node_group_id
    add_index :node_class_memberships, :node_id
    add_index :delayed_jobs, [:failed_at, :run_at, :locked_at, :locked_by], :name => 'index_delayed_jobs_multi'
  end

  def self.down
    remove_index :delayed_jobs, :name => 'index_delayed_jobs_multi'
    remove_index :node_class_memberships, :node_id
    remove_index :node_group_class_memberships, :node_group_id
    remove_index :parameters, :name => 'index_parameters_keys'
    remove_index :node_group_edges, :to_id
    remove_index :node_group_edges, :from_id
  end
end
