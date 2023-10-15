module ApplicationHelper
  def released?(film)
  	film.release_year < Date.current.year ? 'Já lançado' : 'A ser lançado'
  end
end
