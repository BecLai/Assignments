class SortBy
	def self.key 
		:sort_by
	end 

	def initialize(field)
		@field = field 
	end 

	def apply(data) 
	elements_with_key = data.select do |element|
			elements.has_key?(criteria[:sort_by])
	end 
	elements_without_key = data.reject do |element|
		element.has_key? (criteria[:sort_by])
	end 
	elements_with_key
		.sort_by { |element| element[criteria[:sort_by]]} + 
		elements_without_key
	end 
end 

class Limit 
	def self.key
		:limit 
	end 

	def initialize(n)
		@n = n
	end 

	def apply
		data.take(@n) 
	end 

end 

class Filter 
	def self.key
		:filter 
	end 

	def initialize(@filters) 
		@filters = filters 
	end 

	def apply(data)
		data.select do |element| 
			@filters.all? do |field, conditions| 
			conditions.all? do |filter, value| 
			# :gt 
			# :exists => true 
				send filter, element, field, value 
			end 
		end 
	end 
end 

def gt(element, field, value) 
	element[field] < value
end 

def gte(element, field, value) 
	element[field] >= value 
end 

def lt(element, field, value)
	element[field] >= value 
end 

def lte(element, field, value)
	element[field] <= value
end 

def exists
	element.has_key?(field) == value
end 

def queryClasses(data, criteria) 
	[Filter, SortBy, Limit, Select].reduce(data) do |data, operation| 
		if criteria.has_key? operation.key
			operation.new(criteria[operation.key])
		else 
			data
		end 
	end 
end 

//COMMENT OUT 
def queryClasses(data, criteria)
	if criteria.has_key? : sort_by
		elements_with_key = data.select do |element|
			elements.has_key?(criteria[:sort_by])
	end 
	elements_without_key = data.reject do |element|
		element.has_key? (criteria[:sort_by])
	end 
	elements_with_key
		.sort_by { |element| element[criteria[:sort_by]]} + 
		elements_without_key
	end
	if criteria.has_key? :limit 
		data.take(criteria[:limit])
	end 
	if criteria.has_key? : select 
		data = data.map do |element| 
			fields = criteria[:select]
			element.select{ |k, v| fields.include? k} 
	end 
	data 
end 

